import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/applicantTile.dart';
import 'package:flutter/material.dart';

class JobApplicantsView extends StatefulWidget {
  const JobApplicantsView({super.key});

  @override
  State<JobApplicantsView> createState() => _JobApplicantsViewState();
}

class _JobApplicantsViewState extends State<JobApplicantsView> {
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
        children: const [
          ApplicantTile(),
          ApplicantTile(),
          ApplicantTile(),
        ],
      ),
    );
  }
}
