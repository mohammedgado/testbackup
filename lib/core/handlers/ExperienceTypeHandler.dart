import '../enums/experienceTypeEnum.dart';

class ExperienceTypeHandler {
   String name(ExperienceType type) {
    switch (type) {
      case ExperienceType.work:
        return "Company Name";
      case ExperienceType.course:
        return "Course Place";
      case ExperienceType.education:
        return "University";
      default:
        return "";
    }
  }
   String position(ExperienceType type) {
     switch (type) {
       case ExperienceType.work:
         return "JobTitle";
       case ExperienceType.course:
         return "CourseName";
       case ExperienceType.education:
         return "Degree";
       default:
         return "";
     }
   }
}