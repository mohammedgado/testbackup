import 'package:dubai_recruitment/features/job/data/models/category.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:json_annotation/json_annotation.dart';


part 'job.g.dart';

@JsonSerializable()
class Job {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'companyId')
  Company company;
  String title;
  String description;
  String openDate;
  String closeDate;
  @JsonKey(name: 'categoryId')
  Category category;
  String jobType;
  String createdAt;
  String updatedAt;
  @JsonKey(name: '__v')
  int v;

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
    required this.v,
  });


  factory Job.fromJson(Map<String, dynamic> json) =>
      _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);

}
