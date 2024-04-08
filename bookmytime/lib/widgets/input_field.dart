import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';


class InputField extends StatelessWidget{
  final String hinText;
  final Color hintextColor;
  final IconData? iconName;
  final IconData? suffixIconName;
  final Color iconColor;
  final bool obscureText;
  final TextEditingController textController;
  const InputField({
    Key? key,
    required this.hinText,
    this.hintextColor = Pallete.whiteColor,
    this.iconName,
    this.suffixIconName,
    this.iconColor = Pallete.blackColor,
    required this.textController,
    this.obscureText = false,
    }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
      ),
      child: TextFormField(
        controller: textController,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.borderColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.gradient2,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15)
          ),
          hintText: hinText,
          hintStyle: TextStyle(color: hintextColor),
          prefixIcon: Icon(iconName, color: iconColor,),
          suffixIcon: Icon(suffixIconName)
        ),
      ),
    );
  }
}