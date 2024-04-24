import 'dart:convert';

import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:provider/provider.dart';
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
        hideActions: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.memory(
                  base64Decode(
                      UserData().userInfo.userImage!.split('base64,')[1]),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            Provider.of<UserData>(context, listen: false).userInfo.fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Work experience', () {
            context.navigateTo(
                const ExperienceView(experienceType: ExperienceType.work));
          }),
          appListTile('Education', () {
            context.navigateTo(
                const ExperienceView(experienceType: ExperienceType.education));
          }),
          appListTile('Courses', () {
            context.navigateTo(
                const ExperienceView(experienceType: ExperienceType.course));
          }),
          appListTile('Skills', () {
            context.navigateTo(
                const ExperienceView(experienceType: ExperienceType.skill));
          }),
          appListTile('CV', () {
            context.navigateTo(
                const ExperienceView(experienceType: ExperienceType.resume));
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
