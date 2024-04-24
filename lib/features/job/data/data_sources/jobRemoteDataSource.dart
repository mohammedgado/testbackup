import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/job/data/models/applicant.dart';
import 'package:dubai_recruitment/features/job/data/models/applicantInfo.dart';
import 'package:dubai_recruitment/features/job/data/models/category.dart';
import 'package:dubai_recruitment/features/job/data/models/postJob.dart';
import '../../../../core/constants/endPoints.dart';
import '../../../../core/constants/token.dart';
import '../models/job.dart';

void main() async {
//CompanyRemoteDataSource().applyJob();
}

class JobRemoteDataSource {
  Future<List<Job>> requestAllCompaniesJobs() async {
    const String url =
        EndPoints.baseURL + EndPoints.companyJobs + EndPoints.getAll;
    final response = await Dio().get(url);

    final jsonEncoded = json.encode(response.data);
    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> jobList = jsonData['data'];
    print(jobList);
    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    //print(jobs[0].company.companyName);
    return jobs;
  }

  Future<List<Job>> sss(String companyId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.companyJobs}${EndPoints.getAllCompanyJobs}/$companyId";
    final response = await Dio().get(url);

    final jsonEncoded = json.encode(response.data);
    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> jobList = jsonData['data'];

    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    // print(jobs[0].company.companyName);
    return jobs;
  }

  Future<List<Company>> requestAllUserCompanies() async {
    const String url =
        EndPoints.baseURL + EndPoints.recruiterCompany + EndPoints.getAll;
    final response = await Dio().get(
      url,
      options: Options(
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZDFmNmVlMjkyOGU2NDlkMWYwMDZiZCIsImlhdCI6MTcwODI1OTE1NCwiZXhwIjoxNzEwODUxMTU0fQ.7XMGdE-1-f1bhs5kSOE_q23XeQJUbyuQ9i7K7uPvQ_8",
          },
          validateStatus: (statues) {
            print(statues);
            return true;
          }),
    );
    //print(response.data);

    final jsonEncoded = json.encode(response.data);
    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> companiesList = jsonData['data'];

    final List<Company> companies =
        companiesList.map((json) => Company.fromJson(json)).toList();
    print(companies[0].companyName);
    return companies;
  }

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

  /// NEW

  Future<List<Job>> filterJobs(String jobTitle, String district
      // , String jobCategory, String district
      ) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.companyJobs}${EndPoints.getJobsByTitle}?jobTitle=$jobTitle&jobCategory=&District=$district";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');

    final List<dynamic> jobList = response.data['data'];
    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    return jobs;
  }

  Future<List<Job>> getCompanyJobs(String companyId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.companyJobs}${EndPoints.getAllCompanyJobs}/$companyId";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');

    final List<dynamic> jobList = response.data['data'];
    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    return jobs;
  }

  Future<List<Application>> getJobApplicants(String jobId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.jobApplication}${EndPoints.getAllUsersByJobId}$jobId";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    final List<dynamic> applicationsList = response.data['data'];
    final List<Application> applications =
        applicationsList.map((json) => Application.fromJson(json)).toList();
    return applications;
  }

  Future<ApplicantDetails> getApplicantDetails(
      String jobId, String applicantId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.jobApplication}${EndPoints.getEmployeeDetails}$jobId/$applicantId";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    var details = ApplicantDetails.fromJson(response.data);
    return details;
  }

  Future<Response> favoriteJob(String jobId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.favoriteJob}${EndPoints.addNew}";
    print(url);
    final response = await Dio().post(
      url,
      data: {"jobId": jobId},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> unFavoriteJob(String jobId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.favoriteJob}${EndPoints.delete}$jobId";
    print(url);
    final response = await Dio().post(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<List<Job>> getFavouriteJobs() async {
    String url =
        "${EndPoints.baseURL}${EndPoints.favoriteJob}${EndPoints.getAllOfUser}";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    final List<dynamic> jobList = response.data;
    print(jobList[0]['job']);
    final List<Job> jobs = jobList.map((json) => Job.fromJson2(json)).toList();
    return jobs;
  }

  Future<List<Category>> getAllCategories() async {
    String url =
        "${EndPoints.baseURL}${EndPoints.jobCategory}${EndPoints.getAll}";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');

    final List<dynamic> categoryList = response.data['data'];
    final List<Category> categorys =
        categoryList.map((json) => Category.fromJson(json)).toList();
    return categorys;
  }

  Future<List> getAllCountries() async {
    String url = "${EndPoints.baseURL}${EndPoints.country}${EndPoints.getAll}";
    print(url);
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');

    final List countries = response.data['data'];
    return countries;
  }

  Future<List> getDistricts() async {
    String url =
        "${EndPoints.baseURL}${EndPoints.district}${EndPoints.country}/65c485fdd591a001055c617e";
    final response = await Dio().get(
      url,
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');

    final List countries = response.data['data'];
    return countries;
  }

  Future<Response> postNewJob(String title, String desc, String jobType,
      String categoryId, String companyId) async {
    const String url =
        EndPoints.baseURL + EndPoints.companyJobs + EndPoints.addJob;
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "title": title,
        "description": desc,
        "openDate": "2024-02-02",
        "closeDate": "2024-02-05",
        "jobType": jobType,
        "categoryId": categoryId,
        "companyId": companyId
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> editJob(String jobId, String title, String desc,
      String jobType, String categoryId, String companyId) async {
    String url = '${EndPoints.baseURL}${EndPoints.companyJobs}/$jobId';
    print(url);
    final response = await Dio().post(
      url,
      data: {
        "title": title,
        "description": desc,
        "openDate": "2024-02-02",
        "closeDate": "2024-02-05",
        "jobType": jobType,
        "categoryId": categoryId,
        "companyId": companyId
      },
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> applyJob(String jobId) async {
    const String url =
        EndPoints.baseURL + EndPoints.jobApplication + EndPoints.applyUserToJob;
    print(url);
    final response = await Dio().post(
      url,
      data: {"jobId": jobId},
      options: dioOptions,
    );
    print(
        'Status code: ${response.statusCode}, Response Data: ${response.data}');
    return response;
  }

  Future<Response> deleteJob(String jobId) async {
    String url =
        "${EndPoints.baseURL}${EndPoints.companyJobs}${EndPoints.delete}$jobId";
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
