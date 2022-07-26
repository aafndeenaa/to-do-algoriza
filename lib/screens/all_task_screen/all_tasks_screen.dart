import 'package:flutter/material.dart';
import 'package:note_app/screens/add_task_screen/add_task_screen.dart';
import 'package:note_app/task_item.dart';

class AllTasksScreen extends StatefulWidget {
  AllTasksScreen({Key? key}) : super(key: key);
  List<TaskItem> tasks = [
    TaskItem(),
    TaskItem(),
    TaskItem(),
    TaskItem(),
  ];

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: widget.tasks.length,
                itemBuilder: (buildcontext, index) {
                  return widget.tasks[index];
                })),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
              },
              child: const Text('Add a task'),
            ),
          ),
        ),
      ],
    );
  }
}
