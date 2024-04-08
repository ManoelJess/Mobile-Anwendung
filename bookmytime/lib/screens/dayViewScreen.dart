import 'package:bookmytime/customs/customCalendarDataSource.dart';
import 'package:bookmytime/models/Event.dart';
import 'package:bookmytime/screens/addOrSeeAppointment.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/widgets/AppointmentInput.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class DayViewScreen extends StatefulWidget {
  final DateTime selectedDate;
  final List<Appointment> dayEvents;
  const DayViewScreen({
    Key? key,
    required this.selectedDate,
    this.dayEvents = const <Appointment>[],
  }) : super(key: key);

  @override
  _DayViewScreenState createState() => _DayViewScreenState();
}

class _DayViewScreenState extends State<DayViewScreen> {
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: Text(
            "Events on ${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}"),
      ),
      body: Stack(
        children: [
          //Hintergrund
          SfCalendar(
            view: CalendarView.day,
            initialSelectedDate: widget.selectedDate,
            initialDisplayDate: widget.selectedDate,
            allowDragAndDrop: true,
            dataSource: CustomCalendarDataSource(widget.dayEvents),
            onTap: (CalendarTapDetails details) {
              // show the Container to add the appointmnent
              // get a selectionned hour
              // verify the target Elememt
              if (details.targetElement == CalendarElement.calendarCell) {
                DateTime selectedTime = details.date!;
                setState(() {
                  showContainer = true;
                });
              } else if (details.targetElement == CalendarElement.appointment) {
                Event appointment = Event(
                    title: details.appointments![0].subject,
                    startTime: details.appointments![0].startTime,
                    color: Pallete.gradient5,
                    endTime: details.appointments![0].endTime);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddOrSeeAppointment(
                          appointment: appointment,
                        )));
              }
            },
          ),
          if (showContainer)
            AppointmentInput(
              onPressed: () {
                setState(() {
                  showContainer = false;
                });
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
        child: showContainer ? const Icon(Icons.close) : const Icon(Icons.add),
      ),
    );
  }
}
