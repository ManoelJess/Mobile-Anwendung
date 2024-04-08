import 'package:bookmytime/models/announcement.dart';
import 'package:bookmytime/screens/custom_announcement_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class CustomListingScreen extends StatefulWidget {
  final List<Announcement> announcements;
  const CustomListingScreen({
    Key? key,
    required this.announcements
  }) : super(key: key);

  @override
  _CustomListingScreenState createState() => _CustomListingScreenState();
}

class _CustomListingScreenState extends State<CustomListingScreen> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
              title: Text("Anzeige Hilfe",
              style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
              ),
          backgroundColor: Colors.blue,
          ),    
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final announcement = widget.announcements[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(10.0), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), 
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(announcement.title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Titre: ${announcement.title}"),
                          Text("Lieu: ${announcement.location}"),
                          Text("Description: ${announcement.description}"),
                          Text("Date: ${announcement.date != null ? DateFormat('yyyy-MM-dd').format(announcement.date!) : 'Non spécifié'}"),                  
                          Text("Heure de début: ${announcement.startTime.format(context)}"),
                          Text("Heure de fin: ${announcement.endTime.format(context)}"),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomAnnouncementDetailsScreen(announcement: widget.announcements[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              childCount: widget.announcements.length,
            ),
          ),
        ],
      ),
    );
  }
}
