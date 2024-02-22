import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/core/constants/endPoints.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';

import '../models/job.dart';

class JobsRepo {

final JobRemoteDataSource jobRemoteDataSource;

JobsRepo({required this.jobRemoteDataSource});

Future<List<Job>> getAllJobs (){
 return  jobRemoteDataSource.requestAllCompaniesJobs();

}
Future<Response> applyJob (String jobId){
 return  jobRemoteDataSource.applyJob(jobId);

}




}