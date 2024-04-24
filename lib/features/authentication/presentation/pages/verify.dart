import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/features/authentication/data/data_sources/authDataSource.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/authentication/data/repositories/authRepo.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key, required this.apiOTP, required this.userData});
  final String apiOTP;
  final Map<String, dynamic> userData;
  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  String otpText = "";
  bool isLoading = false;

  verifyUser() async {
    setState(() {
      isLoading = true;
    });
    print(
        'API OTP: ${widget.apiOTP} User OTP: $otpText User Data: ${widget.userData} ');
    try {
      var res = await AuthRepo(
        authDataSource: AuthDataSource(),
      ).verifyUser(widget.apiOTP, otpText, widget.userData);
      var user;
      var token;
      print(res);
      user = User.fromJson(res.data['data']['user']);
      token = res.data['data']['token'];

      if (res.data['status'].toString().toLowerCase() == "success") {
        Provider.of<UserData>(context, listen: false).logUser(user, token);
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } catch (e) {
      context.okAlert(title: 'Failed!', message: 'An error occured');
    }

    setState(() {
      isLoading = false;
    });
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
              'Enter the OTP sent to your email',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            OTPTextField(
              length: 8,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 35,
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              fieldStyle: FieldStyle.box,
              keyboardType: TextInputType.text,
              onCompleted: (pin) {
                otpText = pin;
              },
            ),
            const SizedBox(height: 24),
            MaterialButton(
              height: 48,
              onPressed: verifyUser,
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
        ),
      ),
    );
  }
}
