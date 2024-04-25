import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/core/widgets/applicantTile.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/job/data/models/applicant.dart';
import 'package:flutter/material.dart';

class CompanyBookmarksView extends StatefulWidget {
  final Company company;
  const CompanyBookmarksView({super.key, required this.company});

  @override
  State<CompanyBookmarksView> createState() => _CompanyBookmarksViewState();
}

class _CompanyBookmarksViewState extends State<CompanyBookmarksView> {
  List bookmarks = [];
  bool isLoading = true;

  getBookmarks() async {
    try {
      var res =
          await CompanyDataSource().getCompanyBookmarks(widget.company.id);
      bookmarks = res.data;
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookmarks();
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
                ...bookmarks.map(
                  (e) => ApplicantTile(
                    application: Application.fromJson(e['jobApplication']),
                    compaynId: widget.company.id,
                    bookmarkId: e['_id'],
                    userData: User.fromJson(e['user'][0]),
                    refresh: getBookmarks,
                  ),
                ),
              ],
            ),
    );
  }
}
