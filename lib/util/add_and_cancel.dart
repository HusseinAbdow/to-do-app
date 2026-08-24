import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const TaskButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Text(buttonName),
    );
  }
}
