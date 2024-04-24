import 'package:dubai_recruitment/features/job/data/models/category.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';

class Job {
  String id;
  Company company;
  String title;
  String description;
  String openDate;
  String closeDate;
  Category category;
  String jobType;
  String createdAt;
  String updatedAt;

  Job({
    required this.id,
    required this.company,
    required this.title,
    required this.description,
    required this.openDate,
    required this.closeDate,
    required this.category,
    required this.jobType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json['_id'] as String,
        company: Company.fromJson(
            json['companyId'] is String ? json['company'] : json['companyId']),
        title: json['title'] as String,
        description: json['description'] as String,
        openDate: json['openDate'] as String,
        closeDate: json['closeDate'] as String,
        category: Category.fromJson(json['categoryId'] is String
            ? json['category']
            : json['categoryId'] as Map<String, dynamic>),
        jobType: json['jobType'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
      );

  factory Job.fromJson2(Map<String, dynamic> json) => Job(
        id: json['_id'] as String,
        company: Company.fromJson(json['company']),
        title: json['job']['title'] as String,
        description: json['job']['description'] as String,
        openDate: json['job']['openDate'] as String,
        closeDate: json['job']['closeDate'] as String,
        category: Category.fromJson(json['category']),
        jobType: json['job']['jobType'] as String,
        createdAt: json['job']['createdAt'] as String,
        updatedAt: json['job']['updatedAt'] as String,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'companyId': company,
        'title': title,
        'description': description,
        'openDate': openDate,
        'closeDate': closeDate,
        'categoryId': category,
        'jobType': jobType,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
