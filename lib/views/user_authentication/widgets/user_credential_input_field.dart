import 'package:flutter/material.dart';

class UserCredentialInputField extends StatelessWidget {
  const UserCredentialInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isObscur = false,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isObscur;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          // fillColor: const Color(0xFFE1F3EF),
          // filled: true,
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
