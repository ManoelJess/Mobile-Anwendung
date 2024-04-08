import 'package:bookmytime/screens/homePage.dart';
import 'package:bookmytime/services/logInOrRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
const AuthGate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if(snapshot.hasData){
            return const HomePage();
          }
          
          // user is not logged in

          else{
            return const LogInOrRegister();
          }
        },
      ),
    );
  }
}