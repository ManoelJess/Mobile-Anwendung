import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget{
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final VoidCallback onPressed;
  const SocialButton({
    Key? key, 
    required this.iconPath, 
    required this.label,
    this.horizontalPadding = 100,
    required this.onPressed
    }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon:SvgPicture.asset(iconPath, width: 27,) ,
      label:Text(label, style: const TextStyle(
        color: Pallete.blackColor,
        fontSize: 15
      ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: const RoundedRectangleBorder(
          side: const BorderSide(
            color: Pallete.borderColor,
            width: 3,
          ),
        ),
      ),
      );
  }
}