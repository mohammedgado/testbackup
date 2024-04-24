import 'dart:convert';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/bookmarkedJobs.dart';
import 'package:dubai_recruitment/features/profile/presentation/pages/candidateCareerInfo.dart';
import 'package:dubai_recruitment/features/profile/presentation/pages/candidatePersonalInfo.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/appListTile.dart';
import '../../../dashBoard/presentation/pages/dashBoard.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});

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
                  boxShadow: const [
                    BoxShadow(blurRadius: 2, color: Colors.grey)
                  ]),
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
          UserData.userType == 2
              ? appListTile('Recruiter Dashboard', () {
                  context.navigateTo(const DashboardView());
                })
              : SizedBox(),
          UserData.userType == 1
              ? appListTile('Bookmarked Jobs', () {
                  context.navigateTo(const BookmarkedJobsView());
                })
              : SizedBox(),
          appListTile('Profile management', () {
            context.navigateTo(const CandidatePersonalView());
          }),
          appListTile('Career Info', () {
            context.navigateTo(const CandidateCareerView());
          }),
          const ListTile(
            title: Text(
              'Delete account',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<UserData>(context, listen: false).signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            title: const Text(
              'Sign out',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: const Icon(
              Icons.logout,
              color: appDesign.colorPrimary,
            ),
            shape: const Border(
              bottom: BorderSide(width: 1),
            ),
          ),
        ],
      ),
    );
  }
}
