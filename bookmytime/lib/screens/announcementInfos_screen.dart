import 'package:bookmytime/screens/chatPage.dart';
import 'package:bookmytime/services/announcement/announcement_service.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class AnnouncementInfosScreen extends StatefulWidget {
  final String creatorId;
  final String subject;
  final String description;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  const AnnouncementInfosScreen({
    Key? key,
    required this.creatorId,
    required this.subject,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  _AnnouncementInfosScreenState createState() =>
      _AnnouncementInfosScreenState();
}

class _AnnouncementInfosScreenState extends State<AnnouncementInfosScreen> {
  final AnnouncementService _announcementService = AnnouncementService();
  Map<String, dynamic> selectedAnnounce = {};
  String receiverUserMail = "";

  @override
  void initState() {
    super.initState();
    getSelectedAnnounce(widget.creatorId, widget.subject, widget.location,
        widget.startTime, widget.endTime);

    getReceiverUserMail();
  }

  Future<void> getSelectedAnnounce(String userId, String subject,
      String location, DateTime startTime, DateTime endTime) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('announcements')
        .where('userId', isEqualTo: userId)
        .where('title', isEqualTo: subject)
        .where('startDateTime', isEqualTo: startTime)
        .where('endDateTime', isEqualTo: endTime)
        .where('location', isEqualTo: location)
        .get();

    var announce = querySnapshot.docs.first.data() as Map<String, dynamic>;

    setState(() {
      selectedAnnounce = announce;
    });
  }

  Future<void> getReceiverUserMail() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: widget.creatorId)
        .get();

    var user = querySnapshot.docs.first.data() as Map<String, dynamic>;

    setState(() {
      receiverUserMail = user['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: Text('Announcement of'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: Pallete.blackColor),
              color: Pallete.gradient2),
          child: Column(
            children: [
              Text(
                'Subject : ${widget.subject}',
                style: const TextStyle(
                  fontFamily: AutofillHints.familyName,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Location : ${widget.location}',
                style: const TextStyle(
                  fontFamily: AutofillHints.streetAddressLine1,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description : ${widget.description}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'Start Date : ${widget.startTime.day}/${widget.startTime.month}/${widget.startTime.year}',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Time : ${widget.startTime.hour}:${widget.startTime.minute}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'End Date : ${widget.endTime.day}/${widget.endTime.month}/${widget.endTime.year}',
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Time : ${widget.endTime.hour}:${widget.endTime.minute}',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatPage(
                  receiverUserEmail: receiverUserMail,
                  receiverUserID: widget.creatorId),
            ),
          );
        },
        child: const Icon(Icons.call),
      ),
    );
  }
}
