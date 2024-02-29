import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../core/layoutHelpers/responsive.dart';
import '../../../../core/widgets/CustomLoadingButton.dart';
import '../../../../core/widgets/exitButton.dart';
import '../../../../core/widgets/customTextFilled.dart';

class PostJobView extends StatefulWidget {
  const PostJobView({super.key});

  @override
  State<PostJobView> createState() => _PostJobViewState();
}

class _PostJobViewState extends State<PostJobView> {
  final TextEditingController textController = TextEditingController();
  final RoundedLoadingButtonController applyBtnController =
      RoundedLoadingButtonController();



  List<String> jobTypes = ["Remote","Hybrid","OnSite"];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50,
            horizontal: layoutManager.mainHorizontalPadding()),
         // print(" Date IS -> ${ await context.showDatePicker()}");

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CloseButton(),
              EditTextField(title: 'Title', controller: textController,),
              EditTextField(title: 'Title', controller: textController,),




              const SizedBox(height: 24),
              const Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: textController,
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

              value: jobTypes[0],
              items: jobTypes.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value){
            print("change"

            );
          }),
            CustomLoadingButton(
                removePadding: true,
                controller: applyBtnController,
                // text: AppLocalizations.of(context)!.logIn,
                text: 'Post job',
                onPressed: () {
                  // context.navigateTo(ApplyView());
                  // applyBtnController.reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


