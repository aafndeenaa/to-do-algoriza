import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/shared.dart';

class TaskItem extends StatefulWidget {
   const TaskItem({Key? key}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          Checkbox(
              checkColor: Colors.amberAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              }),
          Expanded(
            child: Text('i cant show data'),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.heart),
          ),
        ],
      ),
    );

  }
}
