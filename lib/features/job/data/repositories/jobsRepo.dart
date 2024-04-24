import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dubai_recruitment/core/constants/endPoints.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/category.dart';

import '../models/job.dart';

class JobsRepo {
  final JobRemoteDataSource jobRemoteDataSource;

  JobsRepo({required this.jobRemoteDataSource});

  Future<List<Job>> getAllJobs() {
    return jobRemoteDataSource.requestAllCompaniesJobs();
  }

  Future<List<Job>> filterJobs(String jobTitle, String district) {
    return jobRemoteDataSource.filterJobs(jobTitle, district);
  }

  Future<List<Category>> getAllCategories() {
    return jobRemoteDataSource.getAllCategories();
  }

  Future<List> getAllCountries() {
    return jobRemoteDataSource.getAllCountries();
  }

  Future<List<Job>> requestSpecificCompanyJobs(
      {String comapnyId = '65d207658083916353ed84ef'}) {
    return jobRemoteDataSource.getCompanyJobs(comapnyId);
  }

  Future<Response> applyJob(String jobId) {
    return jobRemoteDataSource.applyJob(jobId);
  }
}
