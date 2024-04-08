import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserDataService extends ChangeNotifier{
  User? user;
  String? _displayName;
  String? _email;

  void setUserDetails(String displayName, String email) {
    _displayName = displayName;
    _email = email;
  }

  String? get displayName => _displayName;
  String? get email => _email;

}