import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
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
        showLogo: true,
        showBackButton: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          dashboardItem(
              title: "Create new Job",
              color: const Color(0xFF86C157),
              icon: Icons.create_new_folder_rounded,
              number: "", onTap: () {
                //context.navigateTo(PostJobView());

            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) => PostJobView(),
                fullscreenDialog: true,
              ),
            );


          }),

          dashboardItem(
              title: "Companies",
              color: const Color(0xFF008DC9),
              icon: Icons.corporate_fare ,
              number: "", onTap: () {

          }),
          dashboardItem(
              title: "My Jobs",
              color: const Color(0xFF008DC9),
              icon: Icons.list_alt,
              number: "", onTap: () {

          })



        ],
      ),
    );
  }
}
