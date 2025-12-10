import 'package:flutter/material.dart';

void showAppSnackBar(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
  SnackBarAction? action,
  Duration duration = const Duration(seconds: 5),
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  final bg = backgroundColor ?? colorScheme.inverseSurface;
  final textColor = colorScheme.onInverseSurface;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: bg,
      action: action,
      duration: duration,
    ),
  );
}
