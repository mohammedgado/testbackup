import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/applicant.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/applicantTile.dart';

class JobApplicantsView extends StatefulWidget {
  final String jobId;
  final String companyId;
  const JobApplicantsView(
      {super.key, required this.jobId, required this.companyId});

  @override
  State<JobApplicantsView> createState() => _JobApplicantsViewState();
}

class _JobApplicantsViewState extends State<JobApplicantsView> {
  List<Application> applications = [];
  bool isLoading = true;
  getJobApplicants() async {
    applications = await JobRemoteDataSource().getJobApplicants(widget.jobId);
    print(applications);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJobApplicants();
  }

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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                ...applications.map(
                  (e) => ApplicantTile(
                    application: e,
                    compaynId: widget.companyId,
                    // bookmarkId: ,
                    refresh: getJobApplicants,
                  ),
                ),
              ],
            ),
    );
  }
}
