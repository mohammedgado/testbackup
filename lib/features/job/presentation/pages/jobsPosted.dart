import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appBar.dart';
import '../widgets/jobCard.dart';

class JobsPostedView extends StatefulWidget {
  const JobsPostedView({super.key});

  @override
  State<JobsPostedView> createState() => _JobsPostedViewState();
}

class _JobsPostedViewState extends State<JobsPostedView> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding()),
        child: ListView(
          children: const [
           // JobCard(isAdmin: false),
           //  JobCard(isAdmin: true),
           //  JobCard(isAdmin: true),
           //  JobCard(isAdmin: true),
          ],
        ),
      ),
    );
  }
}
