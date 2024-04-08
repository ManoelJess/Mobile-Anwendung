import 'package:bookmytime/customs/reusable_widgets.dart';
import 'package:bookmytime/models/announcement.dart';
import 'package:bookmytime/screens/custom_listing_screen.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/validations/validations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class CustomCreateListingScreen extends StatefulWidget {
  const CustomCreateListingScreen({Key? key}) : super(key: key);

  @override
  _CustomCreateListingScreenState createState() =>
      _CustomCreateListingScreenState();
}

class _CustomCreateListingScreenState extends State<CustomCreateListingScreen> {
  final List<Announcement> announcements = [];
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String location = '';
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isValid = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _submitForm() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        final newAnnouncement = Announcement(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          location: location,
          date: selectedDate,
          startTime: startTime ?? const TimeOfDay(hour: 0, minute: 0),
          endTime: endTime ?? const TimeOfDay(hour: 0, minute: 0),
          description: description,
          userId: _auth.currentUser?.uid ?? '',
          userEmail: _auth.currentUser?.email ?? '',
        );

        DateTime startDateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            newAnnouncement.startTime.hour,
            newAnnouncement.startTime.minute);
        DateTime endDateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            newAnnouncement.endTime.hour,
            newAnnouncement.endTime.minute);

        FirebaseFirestore.instance.collection('announcements').add({
          'title': newAnnouncement.title,
          'location': newAnnouncement.location,
          'startDateTime': startDateTime,
          'endDateTime': endDateTime,
          'description': newAnnouncement.description,
          'userId': _auth.currentUser?.uid,
        }).then((_) {
          setState(() {
            announcements.add(newAnnouncement);
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Anzeige erstellt!'),
          ));

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomListingScreen(announcements: announcements),
            ),
          );
        }).catchError((error) {
          print('Error adding announcement to Firestore: $error');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Fehler beim Erstellen der Anzeige: $error'),
            backgroundColor: Colors.red,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: themeProvider.currentTheme.primaryColor,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                        fillColor: Colors.blue,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the subject please';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                    const SizedBox(height: 3),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        fillColor: Colors.blue,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        description = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (v) {
                        if (Validations.adressValidation(v)) {
                          setState(() {
                            isValid = true;
                          });
                        } else {
                          setState(() {
                            isValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Location',
                        fillColor: Colors.blue,
                        suffixIcon: verificationWidget(
                          color: isValid
                              ? Pallete.kGreenColor
                              : const Color.fromARGB(255, 104, 103, 103),
                        ),
                      ),
                      validator: (value) {
                        if (Validations.adressValidation(value!)) {
                          setState(() {
                            isValid = true;
                          });
                          setState(() {
                            isValid = false;
                          });
                          return 'Enter the location';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        location = value!;
                      },
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: <Widget>[
                        const Text(
                          "yy-m-d:",
                          style: TextStyle(
                            fontSize: 12,
                            color: Pallete.blackColor,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => _selectDate(context),
                          icon: const Icon(Icons.calendar_today),
                          label: const Text(""),
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 0.5,
                        ),
                        Row(
                          children: <Widget>[
                            const Text(
                              "Start time:",
                              style: TextStyle(
                                  fontSize: 12, color: Pallete.blackColor),
                            ),
                            const SizedBox(
                              width: 0.5,
                            ),
                            TextButton.icon(
                              onPressed: () => _selectStartTime(context),
                              icon: const Icon(Icons.access_time),
                              label: const Text(""),
                              style: TextButton.styleFrom(primary: Colors.blue),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Text(
                              "End time:",
                              style: TextStyle(
                                  fontSize: 12, color: Pallete.blackColor),
                            ),
                            const SizedBox(
                              width: 0.5,
                            ),
                            TextButton.icon(
                              onPressed: () => _selectEndTime(context),
                              icon: const Icon(Icons.access_time),
                              label: const Text(""),
                              style: TextButton.styleFrom(
                                primary: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _submitForm();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomListingScreen(
                                      announcements: announcements),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: const Text(
                              'Create',
                              style: TextStyle(
                                fontSize: 13,
                                color: Pallete.kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomListingScreen(
                                      announcements: announcements),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                            ),
                            child: const Text(
                              'Display announce',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Pallete.kWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        endTime = picked;
      });
    }
  }
}
