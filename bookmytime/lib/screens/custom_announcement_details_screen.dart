import 'package:bookmytime/models/announcement.dart';
import 'package:bookmytime/screens/chatPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class CustomAnnouncementDetailsScreen extends StatefulWidget {
  final Announcement announcement;
  const CustomAnnouncementDetailsScreen({Key? key, required this.announcement})
      : super(key: key);

  @override
  _CustomAnnouncementDetailsScreenState createState() =>
      _CustomAnnouncementDetailsScreenState();
}

class _CustomAnnouncementDetailsScreenState
    extends State<CustomAnnouncementDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: Text(widget.announcement.title),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Titel: ${widget.announcement.title.toString()}"),
              Text("Ort: ${widget.announcement.location.toString()}"),
              Text(
                  "Beschreibung: ${widget.announcement.description.toString()}"),
              Text(
                  "Datum: ${widget.announcement.date != null ? widget.announcement.date!.toString() : 'Non spécifié'}"),
              Text(
                  "Anfangszeit: ${widget.announcement.startTime.format(context)}"),
              Text("Endzeit: ${widget.announcement.endTime.format(context)}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        receiverUserID: widget.announcement.userId,
                        receiverUserEmail: widget.announcement.userEmail,
                      ),
                    ),
                  );
                },
                child: Text("Chatten"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
