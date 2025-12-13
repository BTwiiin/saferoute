import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/core/main_page.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/features/auth/presentation/pages/login_page.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (authState.session != null) {
      return const HomePage();
    }

    return const LoginPage();
  }
}
