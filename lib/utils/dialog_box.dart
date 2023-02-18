import 'package:flutter/material.dart';
import 'package:todo_app_flutter/utils/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //** text field for user input ->
            TextField(
              controller: controller,
              style: const TextStyle(
                fontFamily: 'poppins_bold',
                letterSpacing: 0.8,
              ),
              decoration: const InputDecoration(
                hintText: 'Add a new Task',
                border: OutlineInputBorder(),
              ),
            ),

            //** buttons for adding and deleting ->
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //** save button ->
                Buttons(
                  text: 'Save',
                  color: Colors.green,
                  onPressed: onSave,
                ),
                const SizedBox(width: 10.0),
                //** cancel button ->
                Buttons(
                  text: 'Cancel',
                  color: Colors.redAccent,
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
