import 'package:bookmytime/screens/logIn_screen.dart';
import 'package:bookmytime/screens/singUp_screen.dart';
import 'package:flutter/material.dart';

class LogInOrRegister extends StatefulWidget {
  final bool showLoginPage;
  const LogInOrRegister({
    Key? key,
    this.showLoginPage = false,
  }) : super(key: key);

  @override
  _logInOrRegisterState createState() => _logInOrRegisterState(this.showLoginPage);
}

class _logInOrRegisterState extends State<LogInOrRegister> {
  // initially show login page
  bool showLoginPagen = false;

  _logInOrRegisterState(bool show){
    this.showLoginPagen = show;
  }

// toogle between login and register page
  void tooglePages() {
    setState(() {
      showLoginPagen = !showLoginPagen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPagen) {
      return LogInScreen(
        onClick: tooglePages,
      );
    } else {
      return SingUpScreen(onClick: tooglePages);
    }
  }
}
