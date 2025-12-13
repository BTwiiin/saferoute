import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/core/widgets/app_bottom_nav_bar.dart';
import 'package:saferoute/core/widgets/rotating_button.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/features/map/presentation/widgets/map.dart';
import 'package:saferoute/features/map/presentation/widgets/safety_summary_panel.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: const MapWidget(),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              child: SafetySummaryPanel(
                score: 85,
                alertsCount: 3,
                weatherRiskLabel: 'Low',
              ),
            ),
          ),

          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconDropdownMenu(
                  items: [
                    IconDropdownItem(
                      icon: Icons.settings,
                      onTap: () {
                        // Navigator.of(context).push(...);
                      },
                    ),
                    IconDropdownItem(
                      icon: Icons.logout,
                      onTap: () {
                        ref.read(authNotifierProvider.notifier).logout();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
