class UserCourse {
  String? id;
  String courseName;
  String place;
  String grade;
  String toDate;
  String fromDate;

  UserCourse({
    this.id,
    required this.courseName,
    required this.place,
    required this.grade,
    required this.fromDate,
    required this.toDate,
  });

  factory UserCourse.fromJson(Map<String, dynamic> json) {
    return UserCourse(
      id: json['_id'],
      courseName: json['courseName'],
      place: json['place'],
      grade: json['grade'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
    );
  }

  Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "place": place,
        "grade": grade,
        "fromDate": fromDate,
        "toDate": toDate
      };
}
