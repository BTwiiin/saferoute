import 'package:flutter/material.dart';

class AuthPageLink extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  const AuthPageLink({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final Color bodyTextColor =
        textTheme.bodyMedium?.color ?? colorScheme.onSurface;
    final Color mutedBodyTextColor = bodyTextColor.withOpacity(0.7);
    final Color linkColor = theme.brightness == Brightness.dark
        ? colorScheme.onSurface
        : colorScheme.primary;

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            promptText,
            style: textTheme.bodyMedium?.copyWith(
              color: mutedBodyTextColor,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionText,
              style: textTheme.bodyMedium?.copyWith(
                color: linkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
