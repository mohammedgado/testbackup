import 'package:flutter/material.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/appListTile.dart';
import 'package:recruitment/Views/companyProfile.dart';
import 'package:recruitment/Views/dashboard.dart';
import 'package:recruitment/Views/jobApplicants.dart';
import 'package:recruitment/Views/jobsPosted.dart';
import 'package:recruitment/Views/postJob.dart';

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
            'LinkYou Company',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Dashboard', () {
            context.navigateTo(const DashboardView());
          }),
          appListTile('Profile management', () {
            context.navigateTo(const CompanyProfileView());
          }),
          appListTile('Jobs posted', () {
            context.navigateTo(const JobsPostedView());
          }),
          appListTile('Post a new job', () {
            context.navigateTo(const PostJobView());
          }),
          appListTile('Saved applicants', () {
            context.navigateTo(const JobApplicantsView());
          }),
          ListTile(
            onTap: () {},
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
