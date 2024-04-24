import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dio/dio.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/features/profile/data/models/course.dart';
import 'package:dubai_recruitment/features/profile/data/models/education.dart';
import 'package:dubai_recruitment/features/profile/data/models/experience.dart';
import '../../../../core/constants/endPoints.dart';

class ProfileDataSource {
  Options dioOptions = Options(
    headers: {
      'Authorization': "Bearer ${UserData.token}",
    },
    validateStatus: (statusCode) {
      if (statusCode == null) {
        return false;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    },
  );

  Future<Response> getProfile() async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updateProfile(
      String fullName, String email, String phone, String image) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "districtId": "65c485fdd591a001055bb0d1",
        "fullname": fullName,
        "email": email,
        "password": "test@Pass123",
        "phone": "201101234669",
        "image": "",
        "categoryId": 268,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updateUserImage(File image) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);

    String name = DateTime.now().millisecondsSinceEpoch.toString();
    final response = await Dio().post(
      url,
      data: FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path,
            filename: '$name${p.extension(image.path)}'),
      }),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updateUserName(String fullName) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "fullname": fullName,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updateEmail(String email) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "email": email,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updatePhone(String phone) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "phone": phone,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> updatePassword(String password) async {
    const String url = EndPoints.baseURL + EndPoints.myProfile;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "password": password,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // ----------- USER RESUMES --------------
  Future<Response> getAllUserResumes() async {
    const String url =
        EndPoints.baseURL + EndPoints.userResume + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addUserResume(String resume) async {
    const String url =
        EndPoints.baseURL + EndPoints.userResume + EndPoints.addResume;
    print(url);
    final response =
        await Dio().post(url, data: {"file": resume}, options: dioOptions);
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editUserResume(String resumeId, String resume) async {
    String url = '${EndPoints.baseURL}${EndPoints.userResume}/$resumeId';
    print(url);
    final response = await Dio().post(
      url,
      data: {"file": resume},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteUserResume(String resumeId) async {
    String url =
        EndPoints.baseURL + EndPoints.userResume + EndPoints.delete + resumeId;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // ----------- USER COURSES --------------
  Future<Response> getAllUserCourses() async {
    const String url =
        EndPoints.baseURL + EndPoints.userCourse + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addUserCourse(String courseName, String place, String grade,
      String fromDate, String toDate) async {
    const String url =
        EndPoints.baseURL + EndPoints.userCourse + EndPoints.addCourse;
    UserCourse course = UserCourse(
        courseName: courseName,
        place: place,
        grade: grade,
        fromDate: fromDate,
        toDate: toDate);
    print(url);
    final response = await Dio().post(
      url,
      data: course.toJson(),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editUserCourse(String userCourseId, String courseName,
      String place, String grade, String fromDate, String toDate) async {
    String url = '${EndPoints.baseURL}${EndPoints.userCourse}/$userCourseId';
    UserCourse course = UserCourse(
        courseName: courseName,
        place: place,
        grade: grade,
        fromDate: fromDate,
        toDate: toDate);
    print(url);
    final response = await Dio().post(
      url,
      data: course.toJson(),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteUserCourse(String userCourseId) async {
    String url = EndPoints.baseURL +
        EndPoints.userEducation +
        EndPoints.delete +
        userCourseId;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // ----------- USER EDUCATION --------------
  Future<Response> getAllUserEducation() async {
    const String url =
        EndPoints.baseURL + EndPoints.userEducation + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addUserEducation(String place, String degree, String grade,
      String fromDate, String toDate) async {
    const String url =
        EndPoints.baseURL + EndPoints.userEducation + EndPoints.addEducation;
    UserEducation edu = UserEducation(
      place: place,
      degree: degree,
      grade: grade,
      districtId: "65c485fdd591a001055c6aA9",
      fromDate: fromDate,
      toDate: toDate,
    );
    print(url);
    final response = await Dio().post(
      url,
      data: edu.toJson(),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editUserEducation(String userEducationId, String place,
      String degree, String grade, String fromDate, String toDate) async {
    String url =
        '${EndPoints.baseURL}${EndPoints.userEducation}/$userEducationId';
    UserEducation edu = UserEducation(
        degree: degree,
        place: place,
        districtId: "65c485fdd591a001055c6aA9",
        grade: grade,
        fromDate: fromDate,
        toDate: toDate);
    print(url);
    final response = await Dio().post(
      url,
      data: edu.toJson(),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteUserEducation(String userEducationId) async {
    String url = EndPoints.baseURL +
        EndPoints.userEducation +
        EndPoints.delete +
        userEducationId;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // ----------- USER EXPERIENCE -------------

  Future<Response> getAllUserExperience() async {
    const String url =
        EndPoints.baseURL + EndPoints.userExperience + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addUserExperience(String company, String jobTitle,
      String comment, String fromDate, String toDate) async {
    const String url =
        EndPoints.baseURL + EndPoints.userExperience + EndPoints.addExperience;
    print(url);
    UserExperience exp = UserExperience(
        company: company,
        jobTitle: jobTitle,
        comment: comment,
        fromDate: fromDate,
        toDate: toDate);
    final response = await Dio().post(
      url,
      data: exp.toJson(),
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editUserExperience(String userExperienceId, String company,
      String jobTitle, String comment, String fromDate, String toDate) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.userExperience}/$userExperienceId";
    print(url);
    UserExperience exp = UserExperience(
        company: company,
        jobTitle: jobTitle,
        comment: comment,
        fromDate: fromDate,
        toDate: toDate);
    final response =
        await Dio().post(url, data: exp.toJson(), options: dioOptions);
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteUserExperienc(String userExperienceId) async {
    String url = EndPoints.baseURL +
        EndPoints.userExperience +
        EndPoints.delete +
        userExperienceId;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // ------------- USER SKILLS ---------------
  Future<Response> getAllSKills() async {
    const String url =
        EndPoints.baseURL + EndPoints.userSkill + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addSkill(String skill) async {
    const String url =
        EndPoints.baseURL + EndPoints.userSkill + EndPoints.addSkill;
    print(url);
    final response =
        await Dio().post(url, data: {"skillName": skill}, options: dioOptions);
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editSkill(String skillId, String skillName) async {
    String url = '${EndPoints.baseURL}${EndPoints.userSkill}/$skillId';
    print(url);
    final response = await Dio().post(
      url,
      data: {"skillName": skillName},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteSkill(String skillId) async {
    String url =
        EndPoints.baseURL + EndPoints.userSkill + EndPoints.delete + skillId;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }
}
