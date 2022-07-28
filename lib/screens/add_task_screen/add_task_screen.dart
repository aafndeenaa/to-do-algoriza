import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/componanat.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var dateController = TextEditingController();

  var startTimeController = TextEditingController();

  var endTimeController = TextEditingController();

  var remindController = TextEditingController();

  var repeatController = TextEditingController();

  var selectedDate = DateTime.now();
  late bool isStartTime;
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now());

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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
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
              HeadrTitle(
                  headr: 'Title',
                  fontwidth: FontWeight.bold,
                  fontSize: 18,
                  textColor: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyForm(
                  type: TextInputType.text,
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '  Pleas add title ';
                    }
                  },
                ),
              ),
              HeadrTitle(
                  headr: "Date",
                  textColor: Colors.black,
                  fontSize: 18,
                  fontwidth: FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                ),
                child: MyForm(
                  controller: dateController,
                  type: TextInputType.datetime,
                  radius: 10.0,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2025-08-31'),
                    ).then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                      debugPrint(DateFormat.yMMMd().format(value));
                    });
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return '  Pleas add Date ';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: HeadrTitle(
                          headr: 'Start Time',
                          fontwidth: FontWeight.bold,
                          fontSize: 15,
                          textColor: Colors.black),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: HeadrTitle(
                          headr: 'End Time',
                          fontwidth: FontWeight.bold,
                          fontSize: 15,
                          textColor: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyForm(
                        controller: startTimeController,
                        type: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Start Date';
                          }
                          return null;
                        },
                        radius: 10.0,
                        suffix: Icons.watch_later_outlined,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            startTimeController.text = value!.format(context);
                            debugPrint(value.format(context));
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: MyForm(
                        controller: endTimeController,
                        type: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your End date';
                          }
                          return null;
                        },
                        radius: 10.0,
                        suffix: Icons.watch_later_outlined,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            endTimeController.text = value!.format(context);
                            debugPrint(value.format(context));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 260,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 30, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: const Text('Creat a task'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
