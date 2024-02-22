
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()


class Category {
  @JsonKey(name: '_id')
  int id;
  String categoryName;
  int mainCategoryId;
  @JsonKey(name: '__v')
  int v;

  Category({
    required this.id,
    required this.categoryName,
    required this.mainCategoryId,
    required this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}
