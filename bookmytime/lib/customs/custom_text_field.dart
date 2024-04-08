import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hinText;
  Widget suffix;
  bool? obscureText;
  bool isValid;
  TextEditingController controller;
  void Function(String)? onChange;
  CustomTextField({
    Key? key,
    required this.hinText,
    required this.controller,
    this.obscureText,
    required this.isValid,
    required this.suffix,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      obscureText: obscureText ?? false,
      style: const TextStyle(color: Pallete.kGreyColor),
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: const TextStyle(color: Pallete.kGreyColor),
        fillColor: Pallete.kTextFieldBgColor,
        filled: true,
        suffixIcon: suffix,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 13.0, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: isValid
                  ? Pallete.kPrimaryColor
                  : Pallete.kTextFieldBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: isValid ? Pallete.kPrimaryColor : Colors.grey, width: 2),
        ),
      ),
    );
  }
}
