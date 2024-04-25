import 'package:dubai_recruitment/core/Managers/ImagePickerManager.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/core/widgets/phoneTextField.dart';
import 'package:dubai_recruitment/core/widgets/roundedLoadingButton.dart';
import 'package:dubai_recruitment/features/company/data/data_sources/companyDataSources.dart';
import 'package:dubai_recruitment/features/company/data/models/company.dart';
import 'package:dubai_recruitment/features/job/data/data_sources/jobRemoteDataSource.dart';
import 'package:dubai_recruitment/features/job/data/models/category.dart';
import 'package:flutter/material.dart';
import '../../../../core/layoutHelpers/responsive.dart';
import '../../../../core/widgets/CustomLoadingButton.dart';
import '../../../../core/widgets/customTextFilled.dart';

class AddCompanyView extends StatefulWidget {
  final Company? companyDetails;
  final Function refresh;
  const AddCompanyView({super.key, this.companyDetails, required this.refresh});

  @override
  State<AddCompanyView> createState() => _AddCompanyViewState();
}

class _AddCompanyViewState extends State<AddCompanyView> {
  bool isEdit = false;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  String phoneC = '';
  // final TextEditingController textController = TextEditingController();
  final RoundedLoadingButtonController applyBtnController =
      RoundedLoadingButtonController();

  bool isLoadingCategories = true;
  bool isLoadingDistricts = true;
  int companyCategorySelected = 0;
  int companyDistrictSelected = 0;
  List<Category> categories = [];
  List districts = [];
  ImagePickerManager imagePicker = ImagePickerManager();
  String image = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEdit = widget.companyDetails != null ? true : false;
    if (isEdit) {
      nameC.text = widget.companyDetails!.companyName;
      addressC.text = widget.companyDetails!.address;
    }
    getCategories();
    getDistricts();
  }

  pickImage() async {
    String? imagePicked = await imagePicker.pickOneImage();
    if (imagePicked != null) {
      image = imagePicked;
      print(image);
    }
  }

  void getCategories() async {
    categories = await JobRemoteDataSource().getAllCategories();
    if (isEdit) {
      companyCategorySelected = categories.indexOf(categories.firstWhere(
          (element) => element.id == widget.companyDetails!.categoryId['_id']));
    }
    setState(() {
      isLoadingCategories = false;
    });
  }

  void getDistricts() async {
    districts = await JobRemoteDataSource().getDistricts();
    // if (isEdit) {
    //   companyDistrictSelected = districts.indexOf(districts.firstWhere(
    //       (element) => element.id == widget.companyDetails!.districtId['_id']));
    //   print(districts.indexOf(districts.firstWhere((element) =>
    //       element['_id'] == widget.companyDetails!.districtId['_id'])));
    // }
    setState(() {
      isLoadingDistricts = false;
    });
  }

  addCompany() async {
    if (isEdit) {
      var res = await CompanyDataSource().editCompany(
        widget.companyDetails!.id,
        nameC.text,
        addressC.text,
        phoneC,
        districts[companyDistrictSelected]['_id'], //District
        categories[companyCategorySelected].id, // Category
        image,
      );
      print(res);
    } else {
      var res = await CompanyDataSource().addCompany(
        nameC.text,
        addressC.text,
        phoneC,
        districts[companyDistrictSelected]['_id'], //District
        categories[companyCategorySelected].id, // Category
        image,
      );
      print(res);
      if (res.data['status'] == 'Success') {
        applyBtnController.success();
        widget.refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    applyBtnController.reset();
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
        child: isLoadingCategories || isLoadingDistricts
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditTextField(
                      title: 'Name',
                      controller: nameC,
                    ),
                    EditTextField(
                      title: 'Address',
                      controller: addressC,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Phone number',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                    ),
                    PhoneTextField(
                      labelText: '',
                      onChanged: (text) {
                        phoneC = text;
                      },
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        DropdownButton(
                            value: companyCategorySelected,
                            items: categories.map((item) {
                              return DropdownMenuItem(
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
                                companyCategorySelected = value!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'District',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        DropdownButton(
                            value: companyDistrictSelected,
                            items: districts.map((item) {
                              return DropdownMenuItem(
                                value: districts.indexOf(item),
                                child: SizedBox(
                                    width: Dimensions.widthPercentage(
                                      context,
                                      100 -
                                          layoutManager.mainHorizontalPadding(),
                                    ),
                                    child: Text(
                                      item['districtName'],
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                companyDistrictSelected = value!;
                                print('Selected District: ${districts[value]}');
                              });
                            }),
                      ],
                    ),
                    TextButton(
                        onPressed: pickImage, child: const Text('PickImage')),
                    CustomLoadingButton(
                      removePadding: true,
                      controller: applyBtnController,
                      text: isEdit ? 'Update Company' : 'Add Company',
                      onPressed: addCompany,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
