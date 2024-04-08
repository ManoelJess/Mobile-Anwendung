import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Announcement {
  final String id; 
  final String title;
  final String location;
  final DateTime? date;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;  
  String userId;
  String userEmail;

  Announcement({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.userId,
    required this.userEmail,
  });

  Announcement.fromSnapshot(QueryDocumentSnapshot<Map<String,dynamic>> snapshot)
      :id = snapshot.id,
      title = snapshot['title'],
      location = snapshot['location'],
      date = snapshot['date'],
      startTime = snapshot['startTime'],
      endTime = snapshot['endTime'],
      description = snapshot['description'],
      userId = snapshot['userId'],
      userEmail = snapshot['userEmail'];
}