import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/job/data/models/applicant.dart';
import 'package:dubai_recruitment/features/profile/data/models/course.dart';
import 'package:dubai_recruitment/features/profile/data/models/education.dart';
import 'package:dubai_recruitment/features/profile/data/models/experience.dart';

class ApplicantDetails {
  final String id;
  final User userData;
  final List experience;
  final List education;
  final List courses;
  final List resumes;

  ApplicantDetails({
    required this.id,
    required this.userData,
    required this.experience,
    required this.education,
    required this.courses,
    required this.resumes,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userData.toJson(),
      'employeeExperiences': experience.map((e) => e.toJson()).toList(),
      'employeeEducations': education.map((e) => e.toJson()).toList(),
      'employeeCourses': courses.map((c) => c.toJson()).toList(),
      'employeeResume': courses.map((r) => r.toJson()).toList(),
    };
  }

  static ApplicantDetails fromJson(Map<String, dynamic> json) {
    return ApplicantDetails(
      id: json['employeeJobInfo']['_id'] as String,
      userData: User.fromJson(json['employeeJobInfo']['userId']),
      experience: (json['employeeExperiences'])
          .map((exp) => UserExperience.fromJson(exp))
          .toList(),
      education: (json['employeeEducations'])
          .map((edu) => UserEducation.fromJson(edu))
          .toList(),
      courses: (json['employeeCourses'])
          .map((course) => UserCourse.fromJson(course))
          .toList(),
      resumes: json['employeeResume'],
    );
  }
}
