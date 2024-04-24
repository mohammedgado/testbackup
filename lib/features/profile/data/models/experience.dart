class UserExperience {
  String? id;
  String company;
  String jobTitle;
  String comment;
  String toDate;
  String fromDate;

  UserExperience({
    this.id,
    required this.company,
    required this.jobTitle,
    required this.comment,
    required this.fromDate,
    required this.toDate,
  });

  factory UserExperience.fromJson(Map<String, dynamic> json) {
    return UserExperience(
      id: json['_id'],
      company: json['company'],
      jobTitle: json['jobTitle'],
      comment: json['comment'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
    );
  }

  Map<String, dynamic> toJson() => {
        "company": company,
        "jobTitle": jobTitle,
        "comment": comment,
        "fromDate": fromDate,
        "toDate": toDate
      };
}
