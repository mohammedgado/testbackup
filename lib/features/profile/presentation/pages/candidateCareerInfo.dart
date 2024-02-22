import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/enums/experienceTypeEnum.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/appListTile.dart';
import 'Experience.dart';


class CandidateCareerView extends StatelessWidget {
  const CandidateCareerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'LinkYou User',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Work experience', () {
            context.navigateTo(ExperienceView(experienceType: ExperienceType.work));

          }),
          appListTile('Education', () {
            context.navigateTo(ExperienceView(experienceType: ExperienceType.education));

          }),

          appListTile('Courses', () {
            context.navigateTo(ExperienceView(experienceType: ExperienceType.course));
          }),
          appListTile('Skills', () {
            context.navigateTo(ExperienceView(experienceType: ExperienceType.course));
          }),
          appListTile('CV', () {
            context.navigateTo(ExperienceView(experienceType: ExperienceType.course));
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
