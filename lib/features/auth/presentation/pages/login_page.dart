import 'package:flutter/material.dart';
import 'package:saferoute/core/themes/app_theme.dart';
import 'package:saferoute/features/auth/presentation/widgets/auth_page_link.dart';
import 'package:saferoute/features/auth/presentation/pages/register_page.dart';
import 'package:saferoute/features/auth/presentation/widgets/login_form.dart';
import 'package:saferoute/features/auth/presentation/widgets/social_login_buttons_row.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final Color bodyTextColor =
        textTheme.bodyMedium?.color ?? colorScheme.onSurface;
    final Color mutedBodyTextColor = bodyTextColor.withValues(alpha: 0.7);
    final Color linkColor = theme.brightness == Brightness.dark
        ? colorScheme.onSurface
        : colorScheme.primary;

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
                  loc.welcomeBack,
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  loc.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    color: mutedBodyTextColor,
                  ),
                ),

                const SizedBox(height: 24),

                // Login form
                const LoginForm(),

                const SizedBox(height: 16),

                // Forgot password (still TODO)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // TODO: navigation to ForgotPasswordPage
                    },
                    child: Text(
                      loc.forgotPassword,
                      style: textTheme.bodyMedium?.copyWith(
                        color: linkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

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
                        loc.orContinueWith,
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

                const SizedBox(height: 16),

                // Social buttons
                const SocialLoginButtonsRow(),

                const SizedBox(height: 32),

                // Link to Register
                AuthPageLink(
                  promptText: loc.noAccountPrompt,
                  actionText: loc.signUp,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterPage(),
                      ),
                    );
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
