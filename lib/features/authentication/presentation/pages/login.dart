// ignore_for_file: use_build_context_synchronously

import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/widgets/CustomLoadingButton.dart';
import 'package:dubai_recruitment/core/widgets/appBar.dart';
import 'package:dubai_recruitment/core/widgets/passTextField.dart';
import 'package:dubai_recruitment/core/widgets/roundedLoadingButton.dart';
import 'package:dubai_recruitment/features/authentication/data/data_sources/authDataSource.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/authentication/data/repositories/authRepo.dart';
import 'package:dubai_recruitment/features/authentication/presentation/pages/forgotPassword.dart';
import 'package:dubai_recruitment/features/authentication/presentation/pages/userTypeSelect.dart';
import 'package:dubai_recruitment/features/authentication/presentation/widgets/authTextField.dart';
import 'package:dubai_recruitment/features/job/presentation/pages/findJobHome.dart';
import 'package:easy_linkedin_login/easy_linkedin_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';

final config = LinkedInConfig(
  clientId: '77gr0t07knekax',
  clientSecret: 'Zq4w34kDY462nFFk',
  redirectUrl: 'https://dubairecruitment.net/',
);

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RoundedLoadingButtonController _loginBtnController =
      RoundedLoadingButtonController();
  var email;
  var pass;
  void loginValidation(RoundedLoadingButtonController btnController) async {
    if (email == null || pass == null) {
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: AppLocalizations.of(context)!.emptyMessage,
      );
      btnController.reset();
    } else {
      var user;
      var token;
      try {
        var res =
            await AuthRepo(authDataSource: AuthDataSource()).login(email, pass);
        print(res);
        user = User.fromJson(res.data['data']['user']);
        token = res.data['data']['token'];
      } catch (e) {
        print(e);
      }

      if (user != null) {
        Provider.of<UserData>(context, listen: false).logUser(user, token);
        btnController.success();
      } else {
        context.okAlert(
            title: AppLocalizations.of(context)!.invalid,
            message: AppLocalizations.of(context)!.invalidEmail_Pass);
        btnController.reset();
      }
      // ignore: use_build_context_synchronously
      // Provider.of<UserData>(context, listen: false).logUser(user, token);
      // btnController.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutHelper(context);
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          widgetContext: context,
          showBackButton: false,
          hideElevation: true,
          hideActions: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: layoutManager.mainHorizontalPadding(),
                vertical: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
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
                  'Step into a world of opportunities.',
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
                  controller: emailController,
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: 'Please enter your email address',
                  obscureText: false,
                  onChanged: (value) => email = value,
                ),
                PassTextField(
                  controller: passwordController,
                  onChanged: (value) => pass = value,
                  hintText: '***********',
                ),
                const SizedBox(height: 40),
                CustomLoadingButton(
                  controller: _loginBtnController,
                  // text: AppLocalizations.of(context)!.logIn,
                  text: 'Login',
                  onPressed: () => loginValidation(_loginBtnController),
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
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      '  Or Login with  ',
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
                              width: 1, color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Image.asset('images/x.png'),
                    ),
                    InkWell(
                      onTap: () async {
                        // GoogleSignInAccount account =
                        //     await GSignIn().handleSignIn();
                        // print(account);
                        // ignore: use_build_context_synchronously
                        // context.okAlert(
                        //     title: 'Google Sign in',
                        //     message:
                        //         'Username: ${account.displayName}\nEmail: ${account.email}');
                      },
                      child: Container(
                        width: 105,
                        height: 56,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Image.asset('images/google.png'),
                      ),
                    ),
                    LinkedInCustomButton(
                      config: config,
                      destroySession: true,
                      onError: (error) => print('Error: ${error.message}'),
                      onGetAuthToken: (data) =>
                          print('Access token ${data.accessToken!}'),
                      onGetUserProfile: (user) => context.okAlert(
                          title: 'LinkedIn Sign in',
                          message:
                              'Username: ${user.name}\nEmail: ${user.email}'),
                      child: Container(
                        width: 105,
                        height: 56,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Image.asset('images/linkedin.png'),
                      ),
                    )
                  ],
                ),
                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot your password?',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appDesign.colorText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // context.navigateTo(const SignupView());
                        context.navigateTo(ForgotPasswordView());
                      },
                      child: const Text(
                        'Reset it now',
                        // AppLocalizations.of(context)!.createNewAccount,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: appDesign.colorPrimary,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: appDesign.colorText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // context.navigateTo(const SignupView());
                        context.navigateTo(const UserTypeSelectView());
                      },
                      child: const Text(
                        'Register Now',
                        // AppLocalizations.of(context)!.createNewAccount,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: appDesign.colorPrimary,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
