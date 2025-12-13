import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saferoute/core/widgets/app_snackbar.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/core/main_page.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class SocialLoginButtonsRow extends ConsumerWidget {
  const SocialLoginButtonsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    Future<void> _handleGoogleLogin() async {
      try {
        final signIn = GoogleSignIn.instance;
        await signIn.initialize();

        if (!signIn.supportsAuthenticate()) {
          debugPrint('GoogleSignIn.authenticate not supported on this platform');
          return;
        }

        final GoogleSignInAccount account =
            await signIn.authenticate();

        final idToken = account.authentication.idToken;

        if (idToken == null) {
          debugPrint('GoogleSignIn: idToken is null');
          return;
        }

        await authNotifier.loginWithGoogle(idToken);

        if (!context.mounted) return;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      } on GoogleSignInException catch (e) {
        debugPrint(
          'GoogleSignIn error: code=${e.code.name}, description=${e.description}, details=${e.details}',
        );
      } catch (e) {
        debugPrint('Google login unexpected error: $e');
      }
    }

    Future<void> _handleAppleLogin() async {
      showAppSnackBar(
        context,
        message: loc.appleNotSupported,
      );
    }

    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            icon: Icons.g_mobiledata,
            onTap: _handleGoogleLogin,
          ),
        ),
        const SizedBox(width: 12), // optional spacing
        Expanded(
          child: _SocialButton(
            icon: Icons.apple,
            onTap: _handleAppleLogin,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surface = colorScheme.surface.withOpacity(theme.brightness == Brightness.dark ? 0.85 : 1);
    final outline = colorScheme.onSurface.withOpacity(0.12);

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: surface,
          border: Border.all(color: outline),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            if (theme.brightness == Brightness.light)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Icon(
          icon,
          size: 32,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
