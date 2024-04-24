import 'package:dio/dio.dart';
import '../../../../core/constants/endPoints.dart';

class AuthDataSource {
  Options dioOptions = Options(
    validateStatus: (statusCode) {
      if (statusCode == null) {
        return false;
      } else {
        return statusCode >= 200 && statusCode < 300;
      }
    },
  );

  Future<Response> login(String login, String password) async {
    const String url = EndPoints.baseURL + EndPoints.login;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        'login': login,
        'password': password,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, User Data: ${response.data['data']['user']}');
    return response;
  }

  Future<Response> register(String name, String email, String password,
      int userType, String phone) async {
    const String url = EndPoints.baseURL + EndPoints.register;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        'fullname': name,
        'email': email,
        'password': password,
        'userType': '$userType',
        'phone': phone,
        'districtId': '65c485fdd591a001055bb0e0',
        'categoryId': '65f039b7774a4dcc46893cf4',
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> verifyUser(
      String apiOTP, String userOTP, Map userData) async {
    const String url = EndPoints.baseURL + EndPoints.verifyUser;
    print(url);
    final response = await Dio().post(
      url,
      data: {"optAPI": apiOTP, "optUser": userOTP, "user": userData},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> resetPassword(String email) async {
    const String url = EndPoints.baseURL + EndPoints.forgotPassword;
    print(url);
    final response = await Dio().post(
      url,
      data: {"forgotPassword": email},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }
}
