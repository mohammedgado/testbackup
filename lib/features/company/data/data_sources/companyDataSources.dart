import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:dio/dio.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import '../../../../core/constants/endPoints.dart';

class CompanyDataSource {
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

  Future<Response> bookmarkApplicant(
      String companyID, String applicationId) async {
    String url =
        EndPoints.baseURL + EndPoints.bookmarkApplication + EndPoints.addNew;
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
      data: {
        "companyId": companyID,
        "jobApplicationId": applicationId,
      },
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteBookmark(
      String companyId, String applicationId) async {
    String url =
        '${EndPoints.baseURL}${EndPoints.bookmarkApplication}/deleteByCompanyIdJobAppId';
    print(url);
    final response = await Dio().post(
      data: {
        "companyId": companyId,
        "jobApplicationId": applicationId,
      },
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> getCompanyBookmarks(String companyId) async {
    String url =
        '${EndPoints.baseURL}${EndPoints.bookmarkApplication}${EndPoints.getAllOfCompany}/$companyId';
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  // Future<Response> getCompany() async {
  //   const String url = EndPoints.baseURL + EndPoints.myProfile;
  //   print(url);
  //   final response = await Dio().get(
  //     url,
  //     options: dioOptions,
  //   );
  //   print(
  //       'Status code: ${response.statusCode}, Response Data: ${response.data}');
  //   return response;
  // }

  Future<Response> getAllCompanies() async {
    String url =
        EndPoints.baseURL + EndPoints.recruiterCompany + EndPoints.getAll;
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> getAllCompaniesByRecruiter(String recruiterId) async {
    String url =
        '${EndPoints.baseURL}${EndPoints.recruiterCompany}${EndPoints.getAll}/$recruiterId';
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> getCompany(String companyId) async {
    String url = '${EndPoints.baseURL}/$companyId';
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> addCompany(String companyName, String address, String phone,
      String districtId, String categoryId, String image) async {
    const String url =
        EndPoints.baseURL + EndPoints.recruiterCompany + EndPoints.addCompany;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "companyName": companyName,
        "address": address,
        "phone": phone,
        "image": image,
        "districtId": districtId,
        "categoryId": categoryId,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editCompany(
      String companyId,
      String companyName,
      String address,
      String phone,
      String districtId,
      String categoryId,
      String image) async {
    String url = '${EndPoints.baseURL}${EndPoints.recruiterCompany}/$companyId';
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "companyName": companyName,
        "address": address,
        "phone": phone,
        "image": image,
        "districtId": districtId,
        "categoryId": categoryId,
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteCompany(String companyId) async {
    String url = EndPoints.baseURL +
        EndPoints.recruiterCompany +
        EndPoints.delete +
        companyId;
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
