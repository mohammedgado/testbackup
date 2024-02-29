import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/job/data/models/postJob.dart';
import '../../../../core/constants/endPoints.dart';
import '../../../../core/constants/token.dart';
import '../models/job.dart';

void main() async{


//CompanyRemoteDataSource().applyJob();

}


class JobRemoteDataSource {

  Future<List<Job>> requestAllCompaniesJobs ()async{
    const String url = EndPoints.baseURL + EndPoints.companyJobs + EndPoints.getAll;
    final response = await Dio().get(url);

    final jsonEncoded = json.encode(response.data);
    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> jobList = jsonData['data'];

    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    //print(jobs[0].company.companyName);
    return jobs;
  }
  Future<List<Job>> requestSpecificCompanyJobs (String companyId)async{
    const String url = "${EndPoints.baseURL}${EndPoints.companyJobs}${EndPoints.getAllCompanyJobs}/65d207658083916353ed84ef";
    final response = await Dio().get(url);

    final jsonEncoded = json.encode(response.data);
    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> jobList = jsonData['data'];

    final List<Job> jobs = jobList.map((json) => Job.fromJson(json)).toList();
    // print(jobs[0].company.companyName);
    return jobs;
  }

  Future<List<Company>> requestAllUserCompanies ()async{
    const String url = EndPoints.baseURL + EndPoints.recruiterCompany + EndPoints.getAll;
    final response = await Dio().get(
          url,
          options: Options(
              headers: {
                'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZDFmNmVlMjkyOGU2NDlkMWYwMDZiZCIsImlhdCI6MTcwODI1OTE1NCwiZXhwIjoxNzEwODUxMTU0fQ.7XMGdE-1-f1bhs5kSOE_q23XeQJUbyuQ9i7K7uPvQ_8",

              },
              validateStatus: (statues) {
              print(statues);
              return true ;
      }
          ),
      );
      //print(response.data);

      final jsonEncoded = json.encode(response.data);
      final jsonData = json.decode(jsonEncoded);
      final List<dynamic> companiesList = jsonData['data'];

      final List<Company> companies = companiesList.map((json) => Company.fromJson(json)).toList();
      print(companies[0].companyName);
      return companies;



  }

  Future<Response> postJob() async {
    const String url = EndPoints.baseURL + EndPoints.companyJobs + EndPoints.addJob;
    final job = PostJob(
      title: "Laravel Developer",
      description: "with 4 year experience",
      openDate: "2024-02-02",
      closeDate: "2024-02-05",
      jobType: "3",
      categoryId: 368,
      companyId: "65d207658083916353ed84ef",
    ).toJson();
    final response = await Dio().post(
        url,
        data: job,
        options: Options(
          headers: {
            'Authorization': "Bearer ${Token.userToken}",
          },
        ),
      );

     return response;
  }

  Future<Response> applyJob(String jobId) async {
    const String url = EndPoints.baseURL + EndPoints.jobApplication + EndPoints.applyUserToJob;

    final response = await Dio().post(
      url,
      data: {
        "jobId": jobId
      },
      options: Options(
        headers: {
          'Authorization': "Bearer ${Token.userToken}",
        },
      ),
    );
print(response.data);
    return response;
  }





}