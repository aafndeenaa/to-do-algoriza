import 'package:flutter/material.dart';
import 'package:note_app/componanat.dart';

class AddTaskScreen extends StatelessWidget{

  var titleController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 2,
            color: Colors.grey[300],
            thickness: 2,
          ),
          const SizedBox(
            height: 14,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MyFormField(
            hint: 'Werit Your Task Here',
            controller: titleController,
            validaiton: 'Title must not be empty',
            keyBordType: TextInputType.text,
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MyFormField(
              onClick: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2025-12-30'));
              },
              hint: 'Chose date',
              controller: dateController,
              validaiton: 'you must add date',
              keyBordType: TextInputType.datetime),
        ],
      ),
    );
  }
}

