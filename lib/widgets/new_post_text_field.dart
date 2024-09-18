import 'package:flutter/material.dart';

class NewPostTextField extends StatelessWidget {
  const NewPostTextField({
    super.key,
    required this.hintText, required this.controller,
  });
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
