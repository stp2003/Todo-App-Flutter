import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  //** required variables ->
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFF0C99DF),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            //** check box ->
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.cyan,
            ),

            //** task name ->
            Text(
              taskName,
              style: TextStyle(
                fontFamily: 'poppins_bold',
                color: Colors.black,
                letterSpacing: 0.8,
                fontSize: 15.0,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
