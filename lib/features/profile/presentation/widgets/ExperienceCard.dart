import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/responsive.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';
import 'package:dubai_recruitment/features/profile/data/models/course.dart';
import 'package:dubai_recruitment/features/profile/data/models/education.dart';
import 'package:dubai_recruitment/features/profile/data/models/experience.dart';
import 'package:dubai_recruitment/features/profile/presentation/pages/addExperiencePopUp.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

import '../../../../core/enums/experienceTypeEnum.dart';
import '../../../../core/handlers/ExperienceTypeHandler.dart';

class ExperienceCard extends StatelessWidget {
  ExperienceCard({
    super.key,
    required this.experienceType,
    this.skillData,
    this.userEducation,
    this.userExperience,
    this.userCourse,
    required this.refresh,
    this.editable = true,
  });
  final bool editable;
  final ExperienceType experienceType;
  final Map? skillData;
  final UserEducation? userEducation;
  final UserExperience? userExperience;
  final UserCourse? userCourse;
  String name = "";
  String degree = "";
  String grade = "";
  String fromDate = "          ";
  String toDate = "          ";
  String comment = "";
  late ExperienceTypeHandler experienceTypeHandler;
  final Function refresh;
  @override
  Widget build(BuildContext context) {
    experienceTypeHandler = ExperienceTypeHandler();
    name = experienceTypeHandler.name(experienceType);
    Function() handleDelete;
    handleDelete = () {};
    if (userEducation != null) {
      handleDelete = () async {
        context.actionAlert(
            title: 'Are you sure?',
            onOkPressed: () async {
              await ProfileDataSource().deleteUserEducation(userEducation!.id!);
              refresh();
            });
      };
      name = userEducation!.place;
      degree = userEducation!.degree;
      grade = userEducation!.grade;
      fromDate = userEducation!.fromDate;
      toDate = userEducation!.toDate;
    } else if (userExperience != null) {
      handleDelete = () async {
        context.actionAlert(
            title: 'Are you sure?',
            onOkPressed: () async {
              await ProfileDataSource()
                  .deleteUserExperienc(userExperience!.id!);
              refresh();
            });
      };
      name = userExperience!.company;
      degree = userExperience!.jobTitle;
      comment = userExperience!.comment;
      fromDate = userExperience!.fromDate;
      toDate = userExperience!.toDate;
    } else if (userCourse != null) {
      handleDelete = () async {
        context.actionAlert(
            title: 'Are you sure?',
            onOkPressed: () async {
              await ProfileDataSource().deleteUserCourse(userCourse!.id!);
              refresh();
            });
      };
      name = userCourse!.courseName;
      degree = userCourse!.place;
      grade = userCourse!.grade;
      fromDate = userCourse!.fromDate;
      toDate = userCourse!.toDate;
    } else if (skillData != null) {
      name = skillData!['name'];
    }

    return experienceType == ExperienceType.skill
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.widthPercentage(context, 60),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Spacer(),
                editable
                    ? IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddExperiencePopup(
                                  refresh: refresh,
                                  type: experienceType,
                                  idEdit: skillData!['id'],
                                );
                              });
                        },
                        color: appDesign.colorPrimary,
                      )
                    : SizedBox(),
                editable
                    ? IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          context.actionAlert(
                              title: 'Are you sure?',
                              onOkPressed: () async {
                                await ProfileDataSource()
                                    .deleteSkill(skillData!['id']);
                                refresh();
                              });
                        },
                        color: appDesign.red,
                      )
                    : SizedBox()
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.widthPercentage(context, 60),
                      child: Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    editable
                        ? IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddExperiencePopup(
                                      refresh: refresh,
                                      type: experienceType,
                                      idEdit: experienceType ==
                                              ExperienceType.education
                                          ? userEducation!.id
                                          : experienceType ==
                                                  ExperienceType.work
                                              ? userExperience!.id
                                              : experienceType ==
                                                      ExperienceType.course
                                                  ? userCourse!.id
                                                  : null,
                                    );
                                  });
                            },
                            color: appDesign.colorPrimary,
                          )
                        : SizedBox(),
                    editable
                        ? IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: handleDelete,
                            color: appDesign.red,
                          )
                        : SizedBox(),
                  ],
                ),
                Text(
                  degree,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Visibility(
                    visible: experienceType == ExperienceType.work
                        ? false
                        : experienceType == ExperienceType.skill
                            ? false
                            : true,
                    child: Text(
                      grade,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    )),
                Visibility(
                  visible: experienceType == ExperienceType.work ? true : false,
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      comment,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      experienceType == ExperienceType.skill ? false : true,
                  child: Text(
                    "${fromDate.substring(0, 10)} -> ${toDate.substring(0, 10)}",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          );
  }
}
