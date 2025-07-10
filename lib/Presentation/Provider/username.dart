import 'package:flutter/widgets.dart';

class UsernameProvider extends ChangeNotifier {
  String username = "";

  void getUserName (String currentUserName) {
    username = currentUserName;
    notifyListeners();
  }

  String get newUsername => username;
}