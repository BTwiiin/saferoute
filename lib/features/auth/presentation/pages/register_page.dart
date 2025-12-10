import 'package:flutter/material.dart';
import 'package:saferoute/core/themes/app_theme.dart';
import 'package:saferoute/features/auth/presentation/pages/login_page.dart';
import 'package:saferoute/features/auth/presentation/widgets/auth_page_link.dart';
import 'package:saferoute/features/auth/presentation/widgets/register_form.dart';
import 'package:saferoute/features/auth/presentation/widgets/social_login_buttons_row.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final Color bodyTextColor =
        textTheme.bodyMedium?.color ?? colorScheme.onSurface;
    final Color mutedBodyTextColor = bodyTextColor.withOpacity(0.7);

    final gradient = theme.brightness == Brightness.light
        ? AppTheme.lightBackgroundGradient
        : AppTheme.darkBackgroundGradient;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.5,
                    child: Image.asset('assets/SafeRouteLogo.png'),
                  ),
                ),

                // Title & subtitle
                Text(
                  loc.createAccountTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  loc.createAccountSubtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    color: mutedBodyTextColor,
                  ),
                ),

                const SizedBox(height: 16),

                // Registration form (with name + confirm password etc.)
                const RegisterForm(),

                const SizedBox(height: 16),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        loc.orSignUpWith,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const SocialLoginButtonsRow(),

                const SizedBox(height: 16),

                // Link back to Login
                AuthPageLink(
                  promptText: loc.alreadyHaveAccount,
                  actionText: loc.signIn,
                  onTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
