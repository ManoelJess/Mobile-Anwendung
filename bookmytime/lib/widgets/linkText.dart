import 'package:flutter/material.dart';

class LinkText extends StatelessWidget{
  final String outputText;
  final Color textColor;
  final VoidCallback? onTap;
  const LinkText({
    Key? key,
    required this.outputText,
    this.textColor = Colors.blue,
    this.onTap,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: TextStyle(
        color: textColor,
        fontSize: 15
      ),
      );
  }
}