import 'package:flutter/material.dart';

class taskButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  taskButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    );
  }
}
