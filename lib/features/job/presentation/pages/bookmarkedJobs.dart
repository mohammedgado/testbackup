import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/job.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appBar.dart';
import '../widgets/jobCard.dart';

class BookmarkedJobsView extends StatefulWidget {
  const BookmarkedJobsView({super.key});

  @override
  State<BookmarkedJobsView> createState() => _BookmarkedJobsViewState();
}

class _BookmarkedJobsViewState extends State<BookmarkedJobsView> {
  List<Job> jobs = [];
  bool isLoading = true;
  getBookmarkedJobs() async {
    jobs = await JobRemoteDataSource().getFavouriteJobs();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookmarkedJobs();
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
                  const Text(
                    'Bookmarked Jobs',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  ...jobs.map(
                    (e) => JobCard(
                      job: e,
                      isAdmin: false,
                      refresh: getBookmarkedJobs,
                      isBookmarked: true,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
