// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as int,
      categoryName: json['categoryName'] as String,
      mainCategoryId: json['mainCategoryId'] as int,
      v: json['__v'] as int,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'categoryName': instance.categoryName,
      'mainCategoryId': instance.mainCategoryId,
      '__v': instance.v,
    };
