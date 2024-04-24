import 'dart:convert';
import 'dart:io';

import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/enums/experienceTypeEnum.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/applicantInfo.dart';
import 'package:dubai_recruitment/features/profile/presentation/widgets/ExperienceCard.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/widgets/appBar.dart';

class ApplicantDetailsView extends StatefulWidget {
  final String jobId;
  final String applicantId;
  const ApplicantDetailsView(
      {super.key, required this.jobId, required this.applicantId});

  @override
  State<ApplicantDetailsView> createState() => _ApplicantDetailsViewState();
}

class _ApplicantDetailsViewState extends State<ApplicantDetailsView> {
  late ApplicantDetails details;
  bool isLoading = true;
  getApplicantDetails() async {
    details = await JobRemoteDataSource()
        .getApplicantDetails(widget.jobId, widget.applicantId);
    print(details);
    setState(() {
      isLoading = false;
    });
  }

  showPDF(base64PDF) async {
    var bytes = base64Decode(base64PDF.replaceAll('\n', ''));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/resume.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());

    print("${output.path}/resume.pdf");
    await OpenFile.open("${output.path}/resume.pdf");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicantDetails();
  }

  @override
  Widget build(BuildContext context) {
    LayoutHelper layoutHelper = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
        hideActions: true,
      ),
      // backgroundColor: Colors.grey.shade200,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: layoutHelper.mainHorizontalPadding()),
              child: ListView(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 2, color: Colors.grey)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.memory(
                              base64Decode(details.userData.userImage!
                                  .split('base64,')[1]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        details.userData.fullName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            fontFamily: 'Inter',
                            color: appDesign.colorPrimary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Resume',
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        showPDF(details.resumes.last['file']);
                      },
                      child: const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Resume.pdf',
                            style: TextStyle(
                              color: Color(0xFF565656),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Contact Details',
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email:    ${details.userData.email}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Phone:   ${details.userData.phone!}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Education',
                    style: TextStyle(fontSize: 22),
                  ),
                  ...details.education.map(
                    (e) => ExperienceCard(
                      experienceType: ExperienceType.education,
                      refresh: () {},
                      userEducation: e,
                      editable: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Work Experience',
                    style: TextStyle(fontSize: 22),
                  ),
                  ...details.experience.map(
                    (e) => ExperienceCard(
                      experienceType: ExperienceType.work,
                      refresh: () {},
                      userExperience: e,
                      editable: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Courses',
                    style: TextStyle(fontSize: 22),
                  ),
                  ...details.courses.map(
                    (e) => ExperienceCard(
                      experienceType: ExperienceType.course,
                      refresh: () {},
                      userCourse: e,
                      editable: false,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
