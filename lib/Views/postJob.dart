import 'package:recruitment/Helper/responsive.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/Views/Shared/CustomLoadingButton.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PostJobView extends StatefulWidget {
  const PostJobView({super.key});

  @override
  State<PostJobView> createState() => _PostJobViewState();
}

class _PostJobViewState extends State<PostJobView> {
  final TextEditingController textController = TextEditingController();

  final RoundedLoadingButtonController applyBtnController =
      RoundedLoadingButtonController();
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
          children: [
            editTextField(context, 'Title', textController),
            editTextField(context, 'Experience level', textController),
            editTextField(context, 'Job type', textController),
            editTextField(context, 'Location', textController),
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
    );
  }
}

Widget editTextField(context, title, controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
      ),
      TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        // maxLines: 5,
        // maxLength: 400,
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
    ],
  );
}
