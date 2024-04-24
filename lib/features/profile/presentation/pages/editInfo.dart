import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/layoutHelpers/responsive.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/core/widgets/phoneTextField.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditInfoView extends StatefulWidget {
  const EditInfoView({
    super.key,
    required this.title,
    this.oldValue,
    required this.type,
    required this.refresh,
  });
  final String title;
  final String? oldValue;
  final Function refresh;
  final String type;
  @override
  State<EditInfoView> createState() => _EditInfoViewState();
}

class _EditInfoViewState extends State<EditInfoView> {
  errorDialog() {
    context.okAlert(
      title: "Error",
      message: "Failed to update data!",
    );
  }

  updateName() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().updateUserName(textController.text);
    if (res.data['status'].toString().toLowerCase() == "success") {
      widget.refresh();
      Navigator.of(context).pop();
      print('Success');
    } else {
      errorDialog();
    }
    setState(() {
      isLoading = false;
    });
  }

  updateEmail() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().updateEmail(textController.text);
    if (res.data['status'].toString().toLowerCase() == "success") {
      widget.refresh();
      Navigator.of(context).pop();
      print('Success');
    } else {
      errorDialog();
    }
    setState(() {
      isLoading = false;
    });
  }

  updatePhone() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().updatePhone(textController.text);
    if (res.data['status'].toString().toLowerCase() == "success") {
      widget.refresh();
      Navigator.of(context).pop();
      print('Success');
    } else {
      errorDialog();
    }
    setState(() {
      isLoading = false;
    });
  }

  updatePassword() async {
    setState(() {
      isLoading = true;
    });
    var res = await ProfileDataSource().updatePassword(textController.text);
    if (res.data != null &&
        res.data['status'].toString().toLowerCase() == "success") {
      widget.refresh();
      Navigator.of(context).pop();
      print('Success');
    } else {
      errorDialog();
    }
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;
  final TextEditingController textController = TextEditingController();
  oldValue() {
    widget.type == 'password' || widget.type == 'phone'
        ? null
        : textController.text = widget.oldValue!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldValue();
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
            horizontal: layoutManager.mainHorizontalPadding()),
        child: ListView(children: [
          const SizedBox(height: 80),
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: '.SF Arabic',
                  color: const Color(0xFF484C52),
                  fontSize: Dimensions.fontSize(context, 1.7),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 20),
              widget.type == 'phone'
                  ? Text(
                      widget.oldValue!,
                      style: const TextStyle(color: Colors.grey),
                    )
                  : SizedBox(),
            ],
          ),
          widget.type == 'phone'
              ? PhoneTextField(
                  labelText: '',
                  controller: textController,
                )
              : TextField(
                  // obscureText: hidePassword,
                  keyboardType: TextInputType.text,
                  controller: textController,
                  style: TextStyle(
                    fontFamily: '.SF Arabic',
                    fontSize: Dimensions.fontSize(context, 1.2),
                    height: 0.9,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
          const SizedBox(height: 24),
          MaterialButton(
            height: 48,
            onPressed: widget.type == 'name'
                ? updateName
                : widget.type == 'email'
                    ? updateEmail
                    : widget.type == 'phone'
                        ? updatePhone
                        : widget.type == 'password'
                            ? updatePassword
                            : () {},
            color: appDesign.colorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
