import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';

class ProfileRepo {
  final ProfileDataSource profileDataSource;

  ProfileRepo({required this.profileDataSource});

  Future<Response> addSkill(String skill) {
    return profileDataSource.addSkill(skill);
  }
}
