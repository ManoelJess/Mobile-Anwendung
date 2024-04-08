import 'package:bookmytime/models/Event.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/widgets/AppointmentInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class AddOrSeeAppointment extends StatefulWidget {
  final Event appointment;
  const AddOrSeeAppointment({Key? key, required this.appointment})
      : super(key: key);

  @override
  _AddOrSeeAppointmentState createState() => _AddOrSeeAppointmentState();
}

class _AddOrSeeAppointmentState extends State<AddOrSeeAppointment> {
  DateTime today = DateTime.now();
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeProvider.currentTheme.primaryColor,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Appointments'),
          elevation: 2,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Pallete.kWhiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Pallete.kPrimaryColor,
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(children: [
                      Text(
                        "Title : ${widget.appointment.title}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Pallete.blackColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Start-time : ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Pallete.blackColor,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${widget.appointment.startTime.day}/${widget.appointment.startTime.month}/${widget.appointment.startTime.year}, ${widget.appointment.startTime.hour}:${widget.appointment.startTime.minute}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Pallete.blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "End-time : ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Pallete.blackColor,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${widget.appointment.endTime.day}/${widget.appointment.endTime.month}/${widget.appointment.endTime.year}, ${widget.appointment.endTime.hour}:${widget.appointment.endTime.minute}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Pallete.blackColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Subject",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Pallete.blackColor,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            if (showContainer)
              AppointmentInput(
                onPressed: () {
                  setState(
                    () {
                      showContainer = false;
                    },
                  );
                },
              )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (showContainer) {
                showContainer = false;
              } else {
                showContainer = true;
              }
            });
          },
          child:
              !showContainer ? const Icon(Icons.add) : const Icon(Icons.close),
        ),
      ),
    );
  }
}
