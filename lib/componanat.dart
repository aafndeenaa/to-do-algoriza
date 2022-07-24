import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String hint;
  final String validaiton;
  final TextInputType keyBordType;
  final TextEditingController controller;
  final GestureTapCallback? onClick;
  const MyFormField({
    Key? key,
    required this.hint,
    required this.controller,
    required this.validaiton,
    required this.keyBordType,
    this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return validaiton;
          }
          return null;
        },
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: keyBordType,
        textAlign: TextAlign.center,
        maxLines: 1,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 229, 231, 233),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 229, 231, 233),
            ),
          ),
          fillColor: const Color.fromARGB(255, 229, 231, 233),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 229, 231, 233),
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
