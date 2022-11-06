import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String prefixIconPath;
  final String hintText;
  final Widget? suffix;
  final TextInputType inputType;
  final bool hideText;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.prefixIconPath,
      this.suffix,
      this.inputType = TextInputType.text,
      this.hideText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: hideText,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: SizedBox(
              height: 20,
              width: 24,
              child: Center(
                  child: Image.asset(
                prefixIconPath,
                height: 24,
                width: 20,
                fit: BoxFit.fill,
              ))),
          suffix: suffix),
    );
  }
}
