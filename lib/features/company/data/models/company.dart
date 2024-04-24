import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: '_id')
  String id;
  String companyName;
  @JsonKey(name: 'userId')
  String? user;
  String image;
  dynamic districtId;
  String phone;
  String address;
  dynamic categoryId;
  String createdAt;
  String updatedAt;
  @JsonKey(name: '__v')
  int v;

  Company({
    required this.id,
    required this.companyName,
    required this.user,
    required this.image,
    required this.districtId,
    required this.phone,
    required this.address,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
