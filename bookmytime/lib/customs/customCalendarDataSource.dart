import 'package:bookmytime/models/Event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CustomCalendarDataSource extends CalendarDataSource<Event>{
  CustomCalendarDataSource(List<Appointment> source){
    appointments = source;
  }
}