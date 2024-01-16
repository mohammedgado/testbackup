import 'dart:convert';

import 'package:dubai_recruitment/Models/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const baseURL =
      "https://tender-chandrasekhar.38-100-170-33.plesk.page/";
  static const user = "User/";
}

class appDesign {
  static const colorText = Color(0xFF111827);
  static const colorPrimary = Color(0xFF386FA4);
  static const colorPrimaryDark = Color(0xff030F2E);
  static const colorPrimaryLight = Color(0xff04BFDB);
  static const colorAccent = Color(0xff04BFDB);
  static const colorAccentDarker = Color(0xFF088395);
  static const colorUnhighlighted = Color(0xff818796);
  static const backGround = Color(0xffffffff);
  static const greyBackground = Color(0xffF5F5F5);
  static const red = Color(0xFFD60000);
}

class UserData extends ChangeNotifier {
  static String language = 'en';
  static bool showNotifications = true;
  static bool firstRun = true;
  // static int userId = 0;
  // static int userType = 0;

  String get userLanguage => language;
  setLanguage(value) {
    language = value;
    saveLanguage();
    notifyListeners();
  }

  saveLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  static User _userInfo = User(
    id: 0,
    displayName: "",
    fullName: "",
    email: "",
    password: "",
    phone: "",
    userImage: "",
    userType: 0,
  );

  User get userInfo => _userInfo;
  bool get isFirstRun => firstRun;

  int getId() {
    return _userInfo.id;
  }

  loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var emptyUser = User(
      id: 0,
      displayName: "",
      fullName: "",
      email: "",
      password: "",
      phone: "",
      userImage: "",
      userType: 0,
    );

    if (prefs.getString('userInfo') != null) {
      _userInfo = User.fromJson(json.decode(prefs.getString('userInfo')!));
    } else {
      _userInfo = emptyUser;
    }

    language = prefs.getString('language') ?? "en";
    firstRun = prefs.getBool('firstRun') ?? true;
    showNotifications = prefs.getBool('showNotifications') ?? true;
    notifyListeners();
    print('Loaded user ID: ${_userInfo.id}');
  }

  void saveUserData(user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userInfo', jsonEncode(user.toJson()));
    if (firstRun == true) {
      updateFirstRun();
    }
  }

  void updateFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstRun', false);
  }

  bool isLoggedIn() {
    bool isLoggedIn = _userInfo.id == 0 ? false : true;
    return isLoggedIn;
  }

  logUser(User? user) {
    print("Logged User: ${user!.toJson().toString()}");
    _userInfo = user;
    saveUserData(user);
    notifyListeners();
  }

  signOut() {
    print("Logged out!");
    User clearUser = User(
      id: 0,
      displayName: "",
      fullName: "",
      email: "",
      password: "",
      phone: "",
      userImage: "",
      userType: 0,
    );
    _userInfo = clearUser;
    saveUserData(clearUser);
    notifyListeners();
  }
}
