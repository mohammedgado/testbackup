import 'package:dubai_recruitment/features/authentication/data/models/user.dart';

class Application {
  String id;
  String jobId;
  User? userData;
  String date;
  bool isBookmarked;
  Application({
    required this.id,
    required this.jobId,
    required this.userData,
    required this.date,
    required this.isBookmarked,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['_id'],
      jobId: json['jobId'],
      userData: json['userId'] is String ? null : User.fromJson(json['userId']),
      date: json['applicationDate'],
      isBookmarked: json['isBookmarked'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userData,
        'jobId': jobId,
        'applicationDate': date,
        'isBookmarked': isBookmarked,
      };
}
