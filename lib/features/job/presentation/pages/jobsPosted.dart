import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/company/presentation/pages/addCompany.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/job.dart';
import 'package:dubai_recruitment/features/job/data/repositories/jobsRepo.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appBar.dart';
import '../widgets/jobCard.dart';

class JobsPostedView extends StatefulWidget {
  final Company company;
  final Function refresh;
  const JobsPostedView(
      {super.key, required this.company, required this.refresh});

  @override
  State<JobsPostedView> createState() => _JobsPostedViewState();
}

class _JobsPostedViewState extends State<JobsPostedView> {
  List<Job> jobs = [];
  bool isLoading = true;
  getjobsPosted() async {
    jobs = await JobsRepo(jobRemoteDataSource: JobRemoteDataSource())
        .requestSpecificCompanyJobs(comapnyId: widget.company.id);
    print(jobs);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getjobsPosted();
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
        hideActions: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: layoutManager.mainHorizontalPadding(),
        ),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.navigateTo(
                          AddCompanyView(companyDetails: widget.company));
                    },
                    child: const Text(
                      'Update Company Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.actionAlert(
                        title: 'Confirmation',
                        message: 'Are you sure you want to delete the company?',
                        onOkPressed: () async {
                          await CompanyDataSource()
                              .deleteCompany(widget.company.id);
                          widget.refresh();
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    child: const Text(
                      'Delete Company',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Company Jobs open:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  ...jobs.map(
                    (e) => JobCard(
                      job: e,
                      isAdmin: true,
                      refresh: getjobsPosted,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
