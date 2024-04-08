import 'package:bookmytime/screens/allUsersChat.dart';
import 'package:bookmytime/screens/home.dart';
import 'package:bookmytime/screens/terminBuchung.dart';
import 'package:bookmytime/services/theme_provider.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';
import 'package:bookmytime/screens/account_screen.dart'; 
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.currentTheme.primaryColor,
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        controller: _pageController,
        children: [
          const Home(),
          const TerminBuchung(),
          const AllUsersChat(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_calendar_sharp), label: "Calendar"),
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
