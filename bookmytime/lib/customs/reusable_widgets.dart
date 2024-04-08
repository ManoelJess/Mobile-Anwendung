import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget verificationWidget({required Color color}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0, bottom: 10, right: 20),
    child: Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: SizedBox(
          height: 15,
          child: Image.asset('assets/icons/check.png'),
        ),
      ),
    ),
  );
}

Widget socialContainer({required String image}) {
  return CupertinoButton(
    minSize: 0,
    padding: EdgeInsets.zero,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Pallete.kWhiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: SizedBox(
          height: 30,
          child: Image.asset(image),
        ),
      ),
    ),
    onPressed:(){},
  );
}

Widget socialWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      socialContainer(image: 'assets/icons/google.png'),
      const SizedBox(width: 70,),
      socialContainer(image: 'assets/icons/apple.png'),
      const SizedBox(width: 70,),
      socialContainer(image: 'assets/icons/facebook.png'),
    ],
  );
}
