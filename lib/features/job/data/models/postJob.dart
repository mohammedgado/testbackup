import 'package:json_annotation/json_annotation.dart';


part 'postJob.g.dart';
@JsonSerializable()
class PostJob {
  String title;
  String description;
  String openDate;
  String closeDate;
  String jobType;
  int categoryId;
  String companyId;

  PostJob({
    required this.title,
    required this.description,
    required this.openDate,
    required this.closeDate,
    required this.jobType,
    required this.categoryId,
    required this.companyId,
  });
  factory PostJob.fromJson(Map<String, dynamic> json) =>
      _$PostJobFromJson(json);

  Map<String, dynamic> toJson() => _$PostJobToJson(this);


}
