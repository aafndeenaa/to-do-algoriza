import 'package:date_time_picker/date_time_picker.dart';
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
              HeadrTitle(Headr: "Title"),
              MyFormField(
                hint: 'Werit Your Task Here',
                controller: titleController,
                validaiton: 'title must not be empty',
                keyBordType: TextInputType.text,
              ),
              HeadrTitle(Headr: "Date"),
              MyFormField(
                  onClick: () {
                    DateTimePicker(
                      type: DateTimePickerType.dateTime,
                      dateMask: 'd MMM, yyyy',
                      controller: dateController,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2025-12-30'),
                    );
                  },
                  controller: dateController,
                  validaiton: 'you must add date',
                  keyBordType: TextInputType.datetime),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadrTitle(Headr: "Start Time"),
                      Container(
                        width: 180,
                        child: MyFormField(
                            onClick: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                startTimeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            controller: startTimeController,
                            validaiton: 'you must add Start Time ',
                            keyBordType: TextInputType.datetime),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadrTitle(Headr: "End Time"),
                      Container(
                        width: 180,
                        child: MyFormField(
                            onClick: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                endTimeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            controller: endTimeController,
                            validaiton: 'you must add end date',
                            keyBordType: TextInputType.datetime),
                      ),
                    ],
                  ),
                ],
              ),
              HeadrTitle(Headr: 'Remind'),
              MyFormField(
                  onClick: () {},
                  controller: remindController,
                  validaiton: 'you must add remindr',
                  keyBordType: TextInputType.datetime),
              HeadrTitle(Headr: 'Repeat'),
              MyFormField(
                  onClick: () {},
                  controller: repeatController,
                  validaiton: 'you must add repeat',
                  keyBordType: TextInputType.datetime),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 30, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('Add a task'),
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
