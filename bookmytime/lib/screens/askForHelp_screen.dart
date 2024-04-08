import 'package:bookmytime/widgets/AppointmentInput.dart';
import 'package:flutter/material.dart';

class AskForHelpScreen extends StatefulWidget {
  const AskForHelpScreen({Key? key}) : super(key: key);

  @override
  _AskForHelpScreenState createState() => _AskForHelpScreenState();
}

class _AskForHelpScreenState extends State<AskForHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask for help'),
      ),
      body: Stack(
        children: [
          //Hintergrund
          Container(),

          AppointmentInput(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
