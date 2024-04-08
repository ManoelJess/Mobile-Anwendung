import 'package:flutter/material.dart';

class Event {
  final String title;
  final Color color;
  final DateTime startTime;
  final DateTime endTime;

  Event({required this.title, required this.startTime, required this.color, required this.endTime});
}
