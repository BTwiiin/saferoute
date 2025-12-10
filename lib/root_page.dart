import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/features/auth/presentation/pages/login_page.dart';
import 'package:saferoute/main_page.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    // still loading from secure storage
    if (authState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // logged in → go to main
    if (authState.session != null) {
      return const SafeRouteHomePage();
    }

    // not logged in → show login
    return const LoginPage();
  }
}
