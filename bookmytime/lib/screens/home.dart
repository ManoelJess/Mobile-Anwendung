import 'package:bookmytime/screens/announcement_screen.dart';
import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/widgets/health_needs.dart';
import 'package:bookmytime/widgets/saved_galeries.dart';
import 'package:bookmytime/widgets/search_bar.dart';
import 'package:bookmytime/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _doctorHand();
}

class _doctorHand extends State<Home> {
  void logOut() {
    // get auth-service

    final authService = Provider.of<AuthServices>(context, listen: false);

    authService.SignOut();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomizeSearchBar(
              height: 35,
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.view_list)),
          IconButton(onPressed: logOut, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // upcoming card
                const UpcomingCard(),
                const SizedBox(height: 20),

                // Health needs
                const HealthNeeds(),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Galerie",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                // Nearby Doctors
                const SavedGaleries(),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Announcements",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                // Announcements
                const AnnouncementScreen(),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
