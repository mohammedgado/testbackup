import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/authentication/data/models/user.dart';

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