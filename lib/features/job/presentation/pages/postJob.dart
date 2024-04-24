import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/core/widgets/chips.dart';
import 'package:dubai_recruitment/core/widgets/roundedLoadingButton.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/category.dart';
import 'package:dubai_recruitment/features/job/data/models/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/layoutHelpers/responsive.dart';
import '../../../../core/widgets/CustomLoadingButton.dart';
import '../../../../core/widgets/exitButton.dart';
import '../../../../core/widgets/customTextFilled.dart';

class PostJobView extends StatefulWidget {
  final bool isEdit;
  final Job? jobData;
  final Function? refresh;
  const PostJobView(
      {super.key, this.isEdit = false, this.jobData, this.refresh});

  @override
  State<PostJobView> createState() => _PostJobViewState();
}

class _PostJobViewState extends State<PostJobView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descController = TextEditingController();
  // final TextEditingController textController = TextEditingController();
  final RoundedLoadingButtonController applyBtnController =
      RoundedLoadingButtonController();
  bool isLoadingCategories = true;
  bool isLoadingDistricts = true;
  bool isLoadingCompanies = true;
  List<String> jobTypes = ["Remote", "OnSite", "Hybrid"];
  String jobTypeSelected = '0';
  int jobCategorySelected = 0;
  int jobDistrictSelected = 0;
  int jobCompanySelected = 0;
  List<Category> categories = [];
  List districts = [];
  List<Company> companies = [];
  @override
  void initState() {
    super.initState();
    getCategories();
    getCompanies();
    if (widget.isEdit) {
      titleController.text = widget.jobData!.title;
      descController.text = widget.jobData!.description;
      jobTypeSelected = (int.parse(widget.jobData!.jobType) - 1).toString();
    }
  }

  void postJob() async {
    await JobRemoteDataSource().postNewJob(
      titleController.text,
      descController.text,
      (int.parse(jobTypeSelected) + 1).toString(),
      categories[jobCategorySelected].id,
      companies[jobCompanySelected].id,
    );
    applyBtnController.reset();
    context.okAlert(title: 'Success', message: 'Your job post is now live!');
  }

  void updateJob() async {
    await JobRemoteDataSource().editJob(
      widget.jobData!.id,
      titleController.text,
      descController.text,
      (int.parse(jobTypeSelected) + 1).toString(),
      categories[jobCategorySelected].id,
      companies[jobCompanySelected].id,
    );
    applyBtnController.reset();
    context.okAlert(title: 'Success', message: 'Your job post is now updated!');
    widget.refresh!();
  }

  void getCategories() async {
    categories = await JobRemoteDataSource().getAllCategories();
    if (widget.isEdit) {
      jobCategorySelected = categories.indexOf(categories.firstWhere(
          (element) =>
              element.categoryName == widget.jobData!.category.categoryName));
    }
    setState(() {
      isLoadingCategories = false;
    });
  }

  getCompanies() async {
    var res = await CompanyDataSource()
        .getAllCompaniesByRecruiter(UserData().userInfo.id!);
    print(res.data['data']);
    for (var e in res.data['data']) {
      companies.add(Company.fromJson(e));
    }
    if (widget.isEdit) {
      jobCompanySelected = companies.indexOf(companies
          .firstWhere((element) => element.id == widget.jobData!.company.id));
    }
    setState(() {
      isLoadingCompanies = false;
    });
  }

  void getDistricts() async {
    districts = await JobRemoteDataSource().getDistricts();
    setState(() {
      isLoadingDistricts = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showLogo: false,
        showBackButton: true,
        hideActions: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: layoutManager.mainHorizontalPadding()),
        // print(" Date IS -> ${ await context.showDatePicker()}");

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CloseButton(),
              EditTextField(
                title: 'Job Title',
                controller: titleController,
              ),
              // EditTextField(
              //   title: 'Title',
              //   controller: textController,
              // ),

              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: descController,
                maxLines: 5,
                maxLength: 400,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  fontSize: Dimensions.fontSize(context, 1.2),
                ),
                decoration: const InputDecoration(
                  hintText: 'Input text here',
                  hintStyle: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              const Text(
                'Job type',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
              DropdownButton(
                  value: jobTypes[int.parse(jobTypeSelected)],
                  items: jobTypes.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: SizedBox(
                          width: Dimensions.widthPercentage(context,
                              100 - layoutManager.mainHorizontalPadding()),
                          child: Text(items)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      jobTypeSelected = jobTypes.indexOf(value!).toString();
                    });
                  }),
              const SizedBox(height: 24),
              isLoadingCategories
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Job category',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        DropdownButton<int>(
                            value: jobCategorySelected,
                            items: categories.map((item) {
                              return DropdownMenuItem<int>(
                                value: categories.indexOf(item),
                                child: SizedBox(
                                    width: Dimensions.widthPercentage(
                                        context,
                                        100 -
                                            layoutManager
                                                .mainHorizontalPadding()),
                                    child: Text(
                                      item.categoryName,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                jobCategorySelected = value!;
                              });
                            }),
                      ],
                    ),

              const SizedBox(height: 24),
              isLoadingCompanies
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Company',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        DropdownButton(
                            value: jobCompanySelected,
                            items: companies.map((item) {
                              return DropdownMenuItem(
                                value: companies.indexOf(item),
                                child: SizedBox(
                                    width: Dimensions.widthPercentage(
                                        context,
                                        100 -
                                            layoutManager
                                                .mainHorizontalPadding()),
                                    child: Text(
                                      item.companyName,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                jobCompanySelected = value!;
                              });
                            }),
                      ],
                    ),

              // isLoadingDistricts
              //     ? const Center(
              //         child: CircularProgressIndicator(),
              //       )
              //     : Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const SizedBox(height: 24),
              //           const Text(
              //             'districtName',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w500, fontSize: 19),
              //           ),
              //           DropdownButton(
              //               value: jobDistrictSelected,
              //               items: districts.map((item) {
              //                 return DropdownMenuItem(
              //                   value: districts.indexOf(item),
              //                   child: SizedBox(
              //                       width: Dimensions.widthPercentage(
              //                           context,
              //                           100 -
              //                               layoutManager
              //                                   .mainHorizontalPadding()),
              //                       child: Text(
              //                         item['districtName'],
              //                         overflow: TextOverflow.ellipsis,
              //                       )),
              //                 );
              //               }).toList(),
              //               onChanged: (value) {
              //                 setState(() {
              //                   jobDistrictSelected = value!;
              //                   print(
              //                       'Selected District: ${districts[value!]}');
              //                 });
              //               }),
              //         ],
              //       ),

              CustomLoadingButton(
                removePadding: true,
                controller: applyBtnController,
                // text: AppLocalizations.of(context)!.logIn,
                text: widget.isEdit ? 'Update job' : 'Post job',
                onPressed: widget.isEdit ? updateJob : postJob,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
