import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  const StyledTextField({
    super.key,
    this.validator,
    this.obscureText = false,
    this.hintText,
    this.onSaved,
    this.initialValue,
  });

  final String? Function(String?)? validator;
  final bool obscureText;
  final String? hintText;
  final void Function(String?)? onSaved;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      obscureText: obscureText,
      onSaved: onSaved,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54)),
    );
  }
}
