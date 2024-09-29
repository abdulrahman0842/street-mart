import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFADCFC8);
const Color secondaryColor = Color(0xFF3F8575);

class AuthTheme {
  static BoxDecoration backgroundDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          primaryColor,
          secondaryColor,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  static TextStyle titleStyle() {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 2,
    );
  }

  static ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: secondaryColor,
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
    );
  }
}
