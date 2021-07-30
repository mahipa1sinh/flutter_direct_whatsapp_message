import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final double width;
  final TextEditingController controller;
  final String title;
  final String hint;
  final TextInputType keyboard;
  final int line;

  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    this.width = 0.5,
    this.title = 'Title',
    this.hint = 'Hint',
    this.keyboard = TextInputType.name,
    this.line = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      child: TextField(
        controller: controller,
        maxLines: line,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          hintText: hint,
        ),
        keyboardType: keyboard,
      ),
    );
  }
}
