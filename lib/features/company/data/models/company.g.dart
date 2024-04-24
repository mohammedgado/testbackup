// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['_id'] as String,
      companyName: json['companyName'] as String,
      user: json['userId'] as String?,
      image: json['image'] as String,
      districtId: json['districtId'],
      phone: json['phone'] as String,
      address: json['address'] as String,
      categoryId: json['categoryId'],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      '_id': instance.id,
      'companyName': instance.companyName,
      'userId': instance.user,
      'image': instance.image,
      'districtId': instance.districtId,
      'phone': instance.phone,
      'address': instance.address,
      'categoryId': instance.categoryId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
