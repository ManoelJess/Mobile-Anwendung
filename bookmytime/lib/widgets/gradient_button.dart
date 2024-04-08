import 'package:flutter/material.dart';
import 'package:bookmytime/tools/pallete.dart';

class GradientButton extends StatelessWidget{
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  final Color textColor;
  final void Function()? action;
  const GradientButton({
    Key? key,
    required this.text,
    required this.buttonHeight,
    required this.buttonWidth,
    this.firstColor = Pallete.gradient1Blue,
    this.secondColor = Pallete.gradient2,
    this.thirdColor = Pallete.gradient3,
    this.textColor = Pallete.whiteColor,
    this.action,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            firstColor,
            secondColor,
            thirdColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth, buttonHeight),
        backgroundColor: Pallete.transparenceColor1,
        shadowColor: Pallete.transparenceColor1
      ), 
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: textColor,
        ),
      )),
    );
  }
}