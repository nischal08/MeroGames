import 'package:flutter/material.dart';

import 'package:merogames/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  CustomTextField({
    this.label,
    this.obscureText,
    this.icon,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      child: TextFormField(
        
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your text';
          }
          return null;
        },
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText ?? false,
        
        decoration: kTfBorder.copyWith(labelText: label, icon: Icon(icon)),
      ),
    );
  }
}
