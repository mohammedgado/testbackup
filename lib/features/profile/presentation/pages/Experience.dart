import 'dart:convert';
import 'dart:io';

import 'package:dubai_recruitment/core/Managers/ImagePickerManager.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';
import 'package:dubai_recruitment/features/profile/data/models/course.dart';
import 'package:dubai_recruitment/features/profile/data/models/education.dart';
import 'package:dubai_recruitment/features/profile/data/models/experience.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/widgets/appBar.dart';
import '../widgets/ExperienceCard.dart';
import '../../../../core/enums/experienceTypeEnum.dart';
import 'addExperiencePopUp.dart';

class ExperienceView extends StatefulWidget {
  final ExperienceType experienceType;
  const ExperienceView({required this.experienceType, Key? key})
      : super(key: key);

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

bool isLoading = true;

class _ExperienceViewState extends State<ExperienceView> {
  late LayoutHelper _layoutManager;
  List skills = [];
  List<UserEducation> education = [];
  List<UserExperience> experience = [];
  List<UserCourse> courses = [];
  List resumes = [];
  int selectedResume = 1;

  showPDF(base64PDF) async {
    var bytes = base64Decode(base64PDF.replaceAll('\n', ''));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/resume.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    print("${output.path}/resume.pdf");
    await OpenFile.open("${output.path}/resume.pdf");
    setState(() {});
  }

  void pickPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final file = File(result.files.single.path!);
      final bytes = await file.readAsBytes();
      String base64PDF = base64Encode(bytes);
      await ProfileDataSource().addUserResume(base64PDF);
    }
  }

  getUserSkills() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().getAllSKills();
    List data = res.data['data'];
    print(data);
    setState(() {
      skills = [];
      for (var element in data) {
        skills.add({'id': element['_id'], 'name': element['skillName']});
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  getUserEducation() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().getAllUserEducation();
    List data = res.data['data'];
    setState(() {
      education = [];
      for (var e in data) {
        education.add(UserEducation.fromJson(e));
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  getUserExperience() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().getAllUserExperience();
    List data = res.data['data'];
    setState(() {
      experience = [];
      for (var e in data) {
        experience.add(UserExperience.fromJson(e));
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  getUserCourses() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().getAllUserCourses();
    List data = res.data['data'];
    setState(() {
      courses = [];
      for (var e in data) {
        courses.add(
          UserCourse.fromJson(e),
        );
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  getUserResumes() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().getAllUserResumes();
    List data = [];
    for (var e in res.data['data']) {
      data.add({'id': e['_id'], 'file': e['file'], 'date': e['addingDate']});
    }
    setState(() {
      resumes = [];
      for (var e in data) {
        resumes.add(e);
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.experienceType == ExperienceType.skill
        ? getUserSkills()
        : widget.experienceType == ExperienceType.education
            ? getUserEducation()
            : widget.experienceType == ExperienceType.work
                ? getUserExperience()
                : widget.experienceType == ExperienceType.course
                    ? getUserCourses()
                    : widget.experienceType == ExperienceType.resume
                        ? getUserResumes()
                        : null;
  }

  @override
  Widget build(BuildContext context) {
    _layoutManager = LayoutHelper(context);

    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
        hideActions: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 16, horizontal: _layoutManager.mainHorizontalPadding()),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : widget.experienceType == ExperienceType.skill
                  ? ListView(
                      children: [
                        ...skills.map(
                          (e) => ExperienceCard(
                            experienceType: widget.experienceType,
                            skillData: e,
                            refresh: getUserSkills,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AddExperiencePopup(
                                  refresh: getUserSkills,
                                  type: widget.experienceType,
                                );
                              },
                            );
                          },
                          child: const Text("Add new Skill"),
                        ),
                      ],
                    )
                  : widget.experienceType == ExperienceType.education
                      ? ListView(
                          children: [
                            ...education.map(
                              (e) => ExperienceCard(
                                experienceType: widget.experienceType,
                                refresh: getUserEducation,
                                userEducation: e,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddExperiencePopup(
                                      refresh: getUserEducation,
                                      type: widget.experienceType,
                                    );
                                  },
                                );
                              },
                              child: const Text("Add new Education"),
                            ),
                          ],
                        )
                      : widget.experienceType == ExperienceType.work
                          ? ListView(
                              children: [
                                ...experience.map(
                                  (e) => ExperienceCard(
                                    experienceType: widget.experienceType,
                                    refresh: getUserExperience,
                                    userExperience: e,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddExperiencePopup(
                                          refresh: getUserExperience,
                                          type: widget.experienceType,
                                        );
                                      },
                                    );
                                  },
                                  child: const Text("Add new work experience"),
                                ),
                              ],
                            )
                          : widget.experienceType == ExperienceType.course
                              ? ListView(
                                  children: [
                                    ...courses.map(
                                      (e) => ExperienceCard(
                                        experienceType: widget.experienceType,
                                        refresh: getUserCourses,
                                        userCourse: e,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddExperiencePopup(
                                              refresh: getUserCourses,
                                              type: widget.experienceType,
                                            );
                                          },
                                        );
                                      },
                                      child: const Text("Add new course"),
                                    ),
                                  ],
                                )
                              : widget.experienceType == ExperienceType.resume
                                  ? ListView(
                                      children: [
                                        ...resumes.map(
                                          (e) => Row(
                                            children: [
                                              Radio(
                                                value: resumes.indexOf(e),
                                                groupValue: selectedResume,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedResume = value!;
                                                  });
                                                },
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  showPDF(e['file']);
                                                },
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.picture_as_pdf,
                                                      color: Colors.red,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      '${resumes.indexOf(e)}_${e['date'].substring(0, 10)}.pdf',
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF565656),
                                                        fontSize: 15,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              TextButton(
                                                onPressed: () async {
                                                  context.actionAlert(
                                                      title: 'Are you sure?',
                                                      onOkPressed: () async {
                                                        await ProfileDataSource()
                                                            .deleteUserResume(
                                                                e['id']);
                                                        getUserResumes();
                                                      });
                                                },
                                                child: const Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            pickPDF();
                                          },
                                          child: const Text("Add new resume"),
                                        ),
                                      ],
                                    )
                                  : const SizedBox()),
    );
  }
}
