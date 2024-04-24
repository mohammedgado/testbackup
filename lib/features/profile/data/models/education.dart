class UserEducation {
  String? id;
  String degree;
  String place;
  dynamic districtId;
  String grade;
  String toDate;
  String fromDate;

  UserEducation({
    this.id,
    required this.degree,
    required this.place,
    required this.districtId,
    required this.grade,
    required this.fromDate,
    required this.toDate,
  });

  factory UserEducation.fromJson(Map<String, dynamic> json) {
    return UserEducation(
      id: json['_id'],
      degree: json['degree'],
      place: json['place'],
      districtId: json['districtId'],
      grade: json['grade'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
    );
  }

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "place": place,
        "districtId": districtId,
        "grade": grade,
        "fromDate": fromDate,
        "toDate": toDate
      };
}
