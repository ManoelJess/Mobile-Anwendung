import 'package:bookmytime/tools/pallete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AnnouncementService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET ANNOUNCEMENT
  Future<List<Map<String, dynamic>>> getAnnouncements() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('announcements').get();

    List<Map<String, dynamic>> announcements = [];

    querySnapshot.docs.forEach((doc) {
      print('document ${doc}');
      announcements.add(doc.data() as Map<String, dynamic>);
    });

    List<Map<String,dynamic>> annoucementTest = [];
    annoucementTest.add(announcements[0]);

    print('Test------------ ${annoucementTest[0]}');

    return announcements;
  }

  Future<List<Map<String, dynamic>>> getUserAnnouncements(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('announcements')
        .where('userId', isEqualTo: userId)
        .get();

    List<Map<String, dynamic>> userAnnouncements = [];

    querySnapshot.docs.forEach((doc) {
      userAnnouncements.add(doc.data() as Map<String, dynamic>);
    });

    return userAnnouncements;
  }

  Future<List<Appointment>> getUserAppointments(String userId) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('announcements')
        .where('userId', isEqualTo: userId)
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

    print('UserId ist : ${userId}');
    print('SnapSHot: ${querySnapshot.docs.first.data()}');

    return [];
  }


  Future<Map<String,dynamic>>getAnnounce(String userId, String subject, String location, DateTime startTime,DateTime endTime)async {
    QuerySnapshot querySnapshot =  await _firestore.collection('announcements').where('userId', isEqualTo: userId).where('title',isEqualTo:subject).where('startDateTime',isEqualTo:startTime).where('endDateTime',isEqualTo:endTime).where('location',isEqualTo:location).get();

    var announce = querySnapshot.docs.first.data() as Map<String,dynamic>;

    return announce;
  }
}
