import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/company/presentation/pages/addCompany.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/jobsPosted.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/appBar.dart';

class MyCompanies extends StatefulWidget {
  const MyCompanies({super.key});

  @override
  State<MyCompanies> createState() => _MyCompaniesState();
}

class _MyCompaniesState extends State<MyCompanies> {
  List<Company> companies = [];
  bool isLoading = true;

  getCompanies() async {
    var res = await CompanyDataSource()
        .getAllCompaniesByRecruiter(UserData().userInfo.id!);
    print(res.data['data']);
    companies = [];
    for (var e in res.data['data']) {
      companies.add(Company.fromJson(e));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    // final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
        hideActions: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            // horizontal: layoutManager.mainHorizontalPadding(),
            ),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.navigateTo(
                          const AddCompanyView(),
                        );
                      },
                      child: const Text(
                        'Add a company',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ...companies.map(
                    (e) => ListTile(
                      shape: Border(
                        bottom: BorderSide(
                            color: appDesign.colorPrimary.withAlpha(150),
                            width: 1),
                      ),
                      minVerticalPadding: 25,
                      onTap: () {
                        context.navigateTo(
                          JobsPostedView(
                            company: e,
                            refresh: getCompanies,
                          ),
                        );
                      },
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: const Color(0x3F5AA5D8),
                            width: 1,
                          ),
                        ),
                        child: Image.asset('images/linkyou.png'),
                        // color: Colors.white,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: appDesign.colorPrimary,
                      ),
                      title: Text(e.companyName),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
