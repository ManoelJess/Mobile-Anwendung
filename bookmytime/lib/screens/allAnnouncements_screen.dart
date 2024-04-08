import 'package:bookmytime/screens/announcement_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class AllAnnouncementsScreen extends StatefulWidget {
  const AllAnnouncementsScreen({Key? key}) : super(key: key);

  @override
  _AllAnnouncementsScreenState createState() => _AllAnnouncementsScreenState();
}

class _AllAnnouncementsScreenState extends State<AllAnnouncementsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: const Text('See all Announcements'),
      ),
      body: const AnnouncementScreen(),
    );
  }
}
