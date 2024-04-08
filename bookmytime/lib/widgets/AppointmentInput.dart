import 'package:bookmytime/screens/custom_create_listing_screen.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class AppointmentInput extends StatefulWidget {
  final void Function()? onPressed;
  const AppointmentInput({Key? key, required this.onPressed}) : super(key: key);

  @override
  _AppointmentInputState createState() => _AppointmentInputState();
}

class _AppointmentInputState extends State<AppointmentInput> {
  final subjecktController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 530,
          decoration: BoxDecoration(
            color: Pallete.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Appointment",
                  style: TextStyle(
                      fontFamily: AutofillHints.middleName,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Pallete.blackColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Pallete.blackColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    children: [CustomCreateListingScreen()],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: widget.onPressed,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.red)),
                      child: const Text(
                        'CLOSE',
                        style: TextStyle(color: Pallete.kWhiteColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
