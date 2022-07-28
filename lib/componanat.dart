import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class MyForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final double radius;
  final IconData? suffix;
  final Function()? suffixPressed;

  const MyForm({
    Key? key,
    required this.controller,
    this.type,
    required this.validator,
    this.onTap,
    this.radius = 0.0,
    this.suffix,
    this.suffixPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class HeadrTitle extends StatelessWidget {
  String headr;
  FontWeight fontwidth;
  double fontSize;
  Color textColor;

  HeadrTitle(
      {Key? key,
      required this.headr,
      required this.textColor,
      required this.fontSize,
      required this.fontwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        headr,
        style: TextStyle(
          fontWeight: fontwidth,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
