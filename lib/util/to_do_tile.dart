import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final bool taskCompleted;
  final String taskName;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 1, 79, 13), // a nice dark green

            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(20),

          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: const Color.fromARGB(255, 158, 246, 177),
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Color.fromARGB(255, 158, 246, 177),
                  decorationThickness: 3,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
