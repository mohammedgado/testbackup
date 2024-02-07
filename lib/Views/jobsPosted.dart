import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/jobCard.dart';
import 'package:flutter/material.dart';

class JobsPostedView extends StatefulWidget {
  const JobsPostedView({super.key});

  @override
  State<JobsPostedView> createState() => _JobsPostedViewState();
}

class _JobsPostedViewState extends State<JobsPostedView> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
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
            JobCard(isAdmin: true),
            JobCard(isAdmin: true),
            JobCard(isAdmin: true),
            JobCard(isAdmin: true),
          ],
        ),
      ),
    );
  }
}
