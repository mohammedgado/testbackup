import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/features/authentication/data/data_sources/authDataSource.dart';
import 'package:dubai_recruitment/features/authentication/data/repositories/authRepo.dart';
import 'package:dubai_recruitment/features/authentication/presentation/widgets/authTextField.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  resetPassword() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await AuthRepo(authDataSource: AuthDataSource())
          .resetPassword(emailController.text);
      if (res.data['status'].toString().toLowerCase() == "success") {
        // ignore: use_build_context_synchronously
        context.okAlert(
            title: 'Email sent',
            message: 'Check your email for steps to reset your password.');
      }
    } catch (e) {
      context.okAlert(title: 'Failed!', message: 'An error occured');
    }
    setState(() {
      isLoading = false;
    });

    // if (res.data['status'] == "Success") {
    //   // ignore: use_build_context_synchronously
    //   context.okAlert(
    //       title: 'Email sent',
    //       message: 'Check your email for steps to reset your password.');
    // } else {
    //   // ignore: use_build_context_synchronously
    //   context.okAlert(title: 'Failed!', message: 'An error occured');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: false,
        hideActions: true,
        hideElevation: true,
        // showLogo: false,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding(), vertical: 16),
          child: ListView(
            children: [
              const SizedBox(height: 80),
              const Text(
                'Reset your password',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              AuthTextField(
                controller: emailController,
                hideLabel: true,
                removePadding: true,
                labelText: "",
                hintText: 'Please enter your email address',
                obscureText: false,
                // onChanged: (value) => email = value,
              ),
              const SizedBox(height: 24),
              MaterialButton(
                height: 48,
                onPressed: resetPassword,
                color: appDesign.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
