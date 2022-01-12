import 'package:flutter/material.dart';
import 'package:blizzard_demo/screens/secret_screen.dart';

/// An alert dialog to enter a password.
///
/// This dialog password protects the [SecretScreen]. It handles input
/// validation and routing to the protected screen.
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();

  /// Routes to the protected screen.
  ///
  /// Closes the dialog box and routes to [SecretScreen]. To be called on
  /// successful entry of the password.
  void redirect(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecretScreen(),
      ),
    );
  }
}

class _PasswordScreenState extends State<PasswordScreen> {
  /// The form state to enable field validation.
  final _formKey = GlobalKey<FormState>();

  /// The user-input text.
  String _inputText = "";

  /// The password required to match the input.
  final String _password = "password";

  /// Validates the user input.
  ///
  /// Validates the user input as specified in the [TextFormField]'s validator
  /// property. If the input is valid (the password is correct), calls the
  /// [redirect] method to handle page routing.
  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.redirect(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Enter Password'),
      contentPadding: const EdgeInsets.all(20.0),
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            autofocus: true,
            autocorrect: false,
            obscureText: true,
            textAlign: TextAlign.center,
            validator: (value) {
              return (value != _password) ? 'Incorrect Password' : null;
            },
            onChanged: (input) {
              setState(
                () {
                  _inputText = input;
                },
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _submit();
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
