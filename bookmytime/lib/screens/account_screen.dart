import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/services/theme_provider.dart';
import 'package:bookmytime/services/user_data_service.dart';
import 'package:bookmytime/pages/theme_selection_page.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:bookmytime/screens/LogIn_screen.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final userDataService = Provider.of<UserDataService>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final PageController _pageController = PageController(initialPage: 0);
    int _currentIndex = 0;


    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Container(
        color: themeProvider.currentTheme.primaryColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              userDataService.user?.displayName ?? 'Full Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              userDataService.user?.email ?? 'Email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text(
              'My Announcements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThemeSelectionPage(),
                  ),
                );
              },
              child: Text('Choose Theme'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService.SignOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInScreen(),
                  ),
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.edit_calendar_sharp), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          } else {
            _pageController.jumpToPage(index);
          }
        },
        iconSize: 20,
        selectedItemColor: Pallete.gradient2,
      ),
    );
  }
}
