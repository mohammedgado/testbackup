import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/company/presentation/pages/bookmarkedApplicants.dart';
import 'package:dubai_recruitment/features/company/presentation/pages/myCompanies.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/jobApplicants.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/postJob.dart';
import 'package:flutter/material.dart';

import '../../../../../../features/job/presentation/pages/jobsPosted.dart';
import '../../../../core/widgets/appBar.dart';
import '../widgets/dashboardItem.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showLogo: false,
        showBackButton: true,
        hideActions: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Recruiter Dashboard',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          dashboardItem(
              title: "Post a new Job",
              color: const Color(0xFF86C157),
              icon: Icons.create_new_folder_rounded,
              number: "",
              onTap: () {
                context.navigateTo(
                  const PostJobView(),
                );
              }),
          dashboardItem(
              title: "My Companies",
              color: const Color(0xFF008DC9),
              icon: Icons.corporate_fare,
              number: "",
              onTap: () {
                context.navigateTo(
                  const MyCompanies(),
                );
              }),
          dashboardItem(
              title: "Saved Applicants",
              color: Colors.indigo.shade400,
              icon: Icons.bookmark,
              number: "",
              onTap: () {
                context.navigateTo(const BookmarkedApplicantsView());
              })
        ],
      ),
    );
  }
}
