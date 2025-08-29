import 'package:flutter/material.dart';
import 'package:flutter_to_do_application/util/add_and_cancel.dart';

class DialogPage extends StatefulWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogPage({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "add task",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                //add button
                taskButton(buttonName: "save", onPressed: widget.onSave),
                SizedBox(width: 100),
                //cancel button
                taskButton(buttonName: "cancel", onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 45, 7),
    );
  }
}
