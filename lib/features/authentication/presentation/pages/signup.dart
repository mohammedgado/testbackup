// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/handlers/ValidatorHandler.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/core/widgets/phoneTextField.dart';
import 'package:dubai_recruitment/core/widgets/roundedLoadingButton.dart';
import 'package:dubai_recruitment/features/authentication/data/data_sources/authDataSource.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/authentication/data/repositories/authRepo.dart';
import 'package:dubai_recruitment/features/authentication/presentation/pages/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

import '../../../../core/widgets/CustomLoadingButton.dart';
import '../../../../core/widgets/passTextField.dart';
import '../widgets/authTextField.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isCandidate = true;
  final _nameController = TextEditingController();
  final _nameInAppController = TextEditingController();
  final _emailController = TextEditingController();
  final RoundedLoadingButtonController _signUpBtnController =
      RoundedLoadingButtonController();
  late ValidatorHandler _validator;

  var name;
  var nameInApp;
  var password;
  var confirmPass;
  var email;
  var number;

  void signUpValidation(RoundedLoadingButtonController btnController) async {
    String? nameError = _validator.validateName(name);
    String? passwordError = _validator.validatePassword(password);
    String? confirmPassError =
        _validator.validateConfirmPassword(password, confirmPass);
    String? numberError = _validator.validateNumber(number);
    String? emailError = _validator.validateEmail(email);

    if (nameError != null ||
        passwordError != null ||
        confirmPassError != null ||
        numberError != null ||
        emailError != null) {
      // Display error message
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: nameError ??
            passwordError ??
            confirmPassError ??
            emailError ??
            numberError ??
            "",
      );
      btnController.reset();
    } else {
      var userData;
      var apiOTP;
      try {
        var res = await AuthRepo(
          authDataSource: AuthDataSource(),
        ).register(name, email, password, UserData.userType, number);
        // Map<String, dynamic> userData = res.data['user'];
        // print('user is: $userData');
        apiOTP = res.data['Otp'];
        print(apiOTP);

        // if (true) {
        // Provider.of<UserData>(context, listen: false).logUser(user, token);
        btnController.reset();
        context.navigateTo(
          VerifyView(
            apiOTP: apiOTP,
            userData: res.data['user'],
          ),
        );
      } catch (e) {
        print(e);
      }
      // } else {
      // context.okAlert(title: 'Failed!', message: 'User already exists!');
      // btnController.reset();
      // }

      // Validation passed, proceed with sign-up
      // print("now we can add to data base");
      // _authController
      //     .signUP(name, nameInApp ?? name!, email, password, number, "")
      //     .then((user) {
      //   if (user != null) {
      //     Provider.of<UserData>(context, listen: false).logUser(user);
      //     Navigator.of(context).pop();
      //     btnController.success();
      //     // context.saveUser(user);
      //     // context.navigateTo(bottom app bar);
      //   } else {
      //     btnController.error();
      //     // context.okAlert(
      //     //   title: AppLocalizations.of(context)!.signUp,
      //     //   message: AppLocalizations.of(context)!.userAlreadyTaken,
      //     // );
      //     btnController.reset();
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    _validator = ValidatorHandler(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: layoutManager.mainHorizontalPadding(), vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    width: 104,
                    height: 25,
                    child: Image.asset("images/logo.png")),
              ),
              const SizedBox(height: 32),
              const Text(
                'Register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF386FA4),
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Unlock Your Career Opportunities',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF919191),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 35),
              AuthTextField(
                controller: _nameController,
                // labelText: AppLocalizations.of(context)!.userName,
                labelText: 'Display name',
                hintText: 'Please enter your first name',
                obscureText: false,
                onChanged: (text) {
                  name = text;
                  setState(() {
                    _nameInAppController.text = text;
                  });
                },
              ),
              // AuthTextField(
              //   controller: _nameInAppController,
              //   // labelText: AppLocalizations.of(context)!.displayName,
              //   labelText: 'Last name',
              //   hintText: 'Please enter your last name',
              //   obscureText: false,
              //   onChanged: (text) {
              //     nameInApp = text;
              //   },
              // ),
              AuthTextField(
                controller: _emailController,
                labelText: AppLocalizations.of(context)!.email,
                hintText: 'Please enter your email address',
                obscureText: false,
                onChanged: (text) {
                  email = text;
                },
              ),
              PhoneTextField(
                labelText: AppLocalizations.of(context)!.phone,
                onChanged: (text) {
                  number = text;
                },
              ),
              PassTextField(
                hintText: '*******************',
                onChanged: (text) {
                  password = text;
                },
              ),
              PassTextField(
                labelText: AppLocalizations.of(context)!.confirmPassword,
                onChanged: (text) {
                  confirmPass = text;
                },
                onEditeComplete: () {},
              ),
              CustomLoadingButton(
                // text: AppLocalizations.of(context)!.createNewAccount,
                text: 'Register',
                controller: _signUpBtnController,
                onPressed: () => signUpValidation(_signUpBtnController),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Center(
                          child: Container(
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE8ECF4),
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                  const Text(
                    '  Or Register with  ',
                    style: TextStyle(
                      color: Color(0xFF6A707C),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Container(
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE8ECF4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 105,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFE8ECF4),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Image.asset('images/x.png'),
                  ),
                  Container(
                    width: 105,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFE8ECF4),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Image.asset('images/google.png'),
                  ),
                  Container(
                    width: 105,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFFE8ECF4),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Image.asset('images/linkedin.png'),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.haveAccount,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appDesign.colorText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Login Now',
                        // AppLocalizations.of(context)!.createNewAccount,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: appDesign.colorPrimary,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
