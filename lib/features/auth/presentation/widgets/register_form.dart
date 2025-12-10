import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saferoute/core/widgets/app_snackbar.dart';
import 'package:saferoute/features/auth/presentation/providers/auth_providers.dart';
import 'package:saferoute/features/auth/presentation/widgets/auth_form.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    return AuthForm(
      buttonText: loc.createAccount,
      isLoading: authState.isLoading,
      errorMessage: authState.errorMessage,

      emailController: _emailController,
      passwordController: _passwordController,

      extraFieldsBeforePassword: [
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(labelText: loc.nameLabel),
          validator: (v) {
            if (v == null || v.isEmpty) return loc.nameRequired;
            return null;
          },
        ),
      ],

      extraFieldsAfterPassword: [
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(labelText: loc.confirmPasswordLabel),
          validator: (v) {
            if (v == null || v.isEmpty) return loc.confirmPasswordRequired;
            if (v != _passwordController.text) {
              return loc.passwordsDoNotMatch;
            }
            return null;
          },
        ),
      ],

      onSubmit: (email, password) async {
        final success =
            await authNotifier.register(email, password, _nameController.text.trim());
        if (!mounted) return;
        if (success) {
          if (context.mounted) {
            showAppSnackBar(
              context,
              message: loc.registrationSuccess,
            );
            Navigator.of(context).pop();
          }
        }
      },
    );
  }
}
