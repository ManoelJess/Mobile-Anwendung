import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScaffold extends StatelessWidget {
  Widget child;

  CustomScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/bgimage.png"),
            )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.305,
            child: customContainer(context),
          )
        ],
      ),
    );
  }

  Widget customContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Pallete.gradient2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(92),
        ),
      ),
      child: child,
    );
  }
}
