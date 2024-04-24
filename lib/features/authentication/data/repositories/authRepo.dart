import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/features/authentication/data/data_sources/authDataSource.dart';

import '../models/user.dart';

class AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepo({required this.authDataSource});

  Future<Response> login(String login, String password) {
    return authDataSource.login(login, password);
  }

  Future<Response> register(
      String name, String email, String password, int userType, String phone) {
    return authDataSource.register(name, email, password, userType, phone);
  }

  Future<Response> verifyUser(String apiOTP, String userOTP, Map userData) {
    return authDataSource.verifyUser(apiOTP, userOTP, userData);
  }

  Future<Response> resetPassword(String email) {
    return authDataSource.resetPassword(email);
  }
}
