import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/l10n/app_localizations.dart';
import 'auth_form.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = AppLocalizations.of(context);
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return AuthForm(
      buttonText: loc.signIn,
      isLoading: authState.isLoading,
      errorMessage: authState.errorMessage,
      onSubmit: (email, password) async {
        await authNotifier.login(email, password);
      },
    );
  }
}
