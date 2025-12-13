import 'package:flutter/material.dart';
import 'package:saferoute/core/themes/app_theme.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppTheme.backgroundDarkBottom.withOpacity(0.96)
        : colors.surface;

    final selectedColor = isDark ? AppTheme.accent : colors.primary;
    final unselectedColor =
        isDark ? AppTheme.textSecondaryDark : colors.onSurface.withOpacity(0.6);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BottomNavigationBar(
        backgroundColor: backgroundColor,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        showUnselectedLabels: true,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        onTap: (_) {},
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: loc.navHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.warning_amber_rounded),
            label: loc.navAlerts,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: loc.navProfile,
          ),
        ],
      ),
    );
  }
}
