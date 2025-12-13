import 'package:flutter/material.dart';
import 'package:saferoute/core/themes/app_theme.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class SafetySummaryPanel extends StatelessWidget {
  const SafetySummaryPanel({
    super.key,
    required this.score,
    required this.alertsCount,
    required this.weatherRiskLabel,
  });

  final int score;
  final int alertsCount;
  final String weatherRiskLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;
    final loc = AppLocalizations.of(context);

    final panelColor = isDark
        ? AppTheme.surfaceAltDark.withOpacity(0.94) // darker, over map
        : colors.surface; // normal cardBgLight

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
        ],
        border: isDark
            ? Border.all(
                color: Colors.white.withOpacity(0.04),
              )
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row: Road Safety Score / Alerts Weather
          Row(
            children: [
              // Left: Score
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black.withOpacity(0.25)
                          : colors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.verified_user,
                      size: 20,
                      color: isDark ? AppTheme.accent : colors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loc.safetyScore,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        '$score',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(),

              // Right: Alerts + Weather label
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        loc.alerts,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        alertsCount.toString(),
                        style: textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        loc.weather,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.water_drop,
                        size: 16,
                        color: isDark ? AppTheme.accent : colors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: colors.onSurface.withOpacity(isDark ? 0.18 : 0.08),
          ),
          const SizedBox(height: 12),

          // Bottom row: Alerts + Weather Risk
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 20,
                    color: isDark ? AppTheme.accent : colors.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${loc.alerts}  $alertsCount',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    loc.weather,
                    style: textTheme.bodySmall?.copyWith(
                      color: colors.onSurface.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    weatherRiskLabel,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppTheme.accent : colors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
