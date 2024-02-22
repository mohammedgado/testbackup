// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['_id'] as String,
      company: Company.fromJson(json['companyId'] as Map<String, dynamic>),
      title: json['title'] as String,
      description: json['description'] as String,
      openDate: json['openDate'] as String,
      closeDate: json['closeDate'] as String,
      category: Category.fromJson(json['categoryId'] as Map<String, dynamic>),
      jobType: json['jobType'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      '_id': instance.id,
      'companyId': instance.company,
      'title': instance.title,
      'description': instance.description,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'categoryId': instance.category,
      'jobType': instance.jobType,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
