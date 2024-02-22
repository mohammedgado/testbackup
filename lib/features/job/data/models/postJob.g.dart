// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postJob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostJob _$PostJobFromJson(Map<String, dynamic> json) => PostJob(
      title: json['title'] as String,
      description: json['description'] as String,
      openDate: json['openDate'] as String,
      closeDate: json['closeDate'] as String,
      jobType: json['jobType'] as String,
      categoryId: json['categoryId'] as int,
      companyId: json['companyId'] as String,
    );

Map<String, dynamic> _$PostJobToJson(PostJob instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'jobType': instance.jobType,
      'categoryId': instance.categoryId,
      'companyId': instance.companyId,
    };
