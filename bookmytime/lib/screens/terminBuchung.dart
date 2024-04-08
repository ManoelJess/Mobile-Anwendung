import 'package:bookmytime/customs/customCalendarDataSource.dart';
import 'package:bookmytime/screens/dayViewScreen.dart';
import 'package:bookmytime/services/announcement/announcement_service.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class TerminBuchung extends StatefulWidget {
  const TerminBuchung({Key? key}) : super(key: key);

  @override
  _TerminBuchungState createState() => _TerminBuchungState();
}

class _TerminBuchungState extends State<TerminBuchung> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AnnouncementService _announcementService = AnnouncementService();
  List<Appointment> userAppointments = [];

  @override
  void initState() {
    super.initState();
    getUserAppointments();
  }

  Future<void> getUserAppointments() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('announcements')
        .where('userId', isEqualTo: _firebaseAuth.currentUser!.uid)
        .get();

    List<Appointment> userAnnouncements =
        querySnapshot.docs.map((announcement) {
      var announceData = announcement.data() as Map<String, dynamic>;
      print('Date : ${announceData['startDateTime'].toDate()}');
      return Appointment(
          startTime: announceData['startDateTime'].toDate(),
          endTime: announceData['endDateTime'].toDate(),
          subject: announceData['title'],
          color: Pallete.goldColor);
    }).toList();

    setState(() {
      userAppointments = userAnnouncements;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
        appBar: AppBar(
          title: const Text(
            "Terminvereinbarung",
            textAlign: TextAlign.center,
          ),
        ),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: CustomCalendarDataSource(userAppointments),
          showTodayButton: true,
          onTap: (CalendarTapDetails details) {
            // if the clicked element is an cell in the calendar
            if (details.targetElement == CalendarElement.calendarCell) {
              if (details.appointments!.isEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DayViewScreen(selectedDate: details.date!)));
              } else {
                List<Appointment> appointments =
                    details.appointments!.map((dynamic item) {
                  return Appointment(
                      startTime: item.startTime,
                      endTime: item.endTime,
                      subject: item.subject,
                      color: item.color);
                }).toList();
                // change the view
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DayViewScreen(
                        selectedDate: details.date!, dayEvents: appointments),
                  ),
                );
              }
            }
          },
        ));
  }
}
