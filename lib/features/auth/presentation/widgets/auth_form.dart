import 'package:flutter/material.dart';
import 'package:saferoute/l10n/app_localizations.dart';

class AuthForm extends StatefulWidget {
  final String buttonText;
  final bool isLoading;
  final String? errorMessage;
  final Future<void> Function(String email, String password) onSubmit;

  // Allow overriding controllers (used for registration)
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  final List<Widget> extraFieldsBeforePassword;
  final List<Widget> extraFieldsAfterPassword;

  const AuthForm({
    super.key,
    required this.buttonText,
    required this.isLoading,
    required this.onSubmit,
    this.errorMessage,

    this.emailController,
    this.passwordController,

    this.extraFieldsBeforePassword = const [],
    this.extraFieldsAfterPassword = const [],
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = widget.emailController ?? TextEditingController();
    _passwordController = widget.passwordController ?? TextEditingController();
  }

  @override
  void dispose() {
    // Only dispose if we created them here
    if (widget.emailController == null) _emailController.dispose();
    if (widget.passwordController == null) _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      await widget.onSubmit(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // EMAIL
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: loc.emailLabel),
            validator: (v) {
              if (v == null || v.isEmpty) return loc.emailRequired;
              if (!v.contains('@')) return loc.emailInvalid;
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Extra fields before password
          ...widget.extraFieldsBeforePassword,
          if (widget.extraFieldsBeforePassword.isNotEmpty)
            const SizedBox(height: 16),

          // PASSWORD
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: loc.passwordLabel),
            validator: (v) {
              if (v == null || v.isEmpty) return loc.passwordRequired;
              if (v.length < 6) return loc.passwordTooShort;
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Extra fields after password
          ...widget.extraFieldsAfterPassword,
          if (widget.extraFieldsAfterPassword.isNotEmpty)
            const SizedBox(height: 16),

          // Submit button
          widget.isLoading
              ? const CircularProgressIndicator()
              : SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _handleSubmit,
                    child: Text(widget.buttonText),
                  ),
                ),

          // Error
          if (widget.errorMessage != null) ...[
            const SizedBox(height: 12),
            Text(widget.errorMessage!, style: const TextStyle(color: Colors.red)),
          ],
        ],
      ),
    );
  }
}
