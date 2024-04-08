import 'package:bookmytime/models/announcement.dart';
import 'package:bookmytime/screens/custom_create_listing_screen.dart';
import 'package:bookmytime/screens/custom_listing_screen.dart';
import 'package:flutter/material.dart';

class Advertissement extends StatefulWidget {
  final List<Announcement> announcements;
  const Advertissement({
    Key? key,
    required this.announcements
  }) : super(key: key);

  @override
  _AdvertissementState createState() => _AdvertissementState();
}

class _AdvertissementState extends State<Advertissement> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Anzeigen'),
          backgroundColor: Colors.blue,
        ),
        body: CustomListingScreen(announcements: widget.announcements),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const CustomCreateListingScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
