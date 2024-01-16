import 'package:dubai_recruitment/Extensions/extensions.dart';
import 'package:dubai_recruitment/Helper/responsive.dart';
import 'package:dubai_recruitment/Managers/LayoutManager.dart';
import 'package:dubai_recruitment/Views/Shared/AppBar.dart';
import 'package:dubai_recruitment/Views/Shared/CustomLoadingButton.dart';
import 'package:dubai_recruitment/Views/Shared/authTextField.dart';
import 'package:dubai_recruitment/Views/Shared/passTextField.dart';
import 'package:dubai_recruitment/Views/home.dart';
import 'package:dubai_recruitment/views/signup.dart';
import 'package:dubai_recruitment/Helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  void loginValidation(RoundedLoadingButtonController btnController) {
    if (email == null || pass == null) {
      context.okAlert(
        title: AppLocalizations.of(context)!.required,
        message: AppLocalizations.of(context)!.emptyMessage,
      );
      btnController.reset();
    } else {
      context.navigateTo(HomeView());

      btnController.reset();
      // btnController.success();
      //LOGIN

      // _authController.login(email, pass).then((user) {
      //   if (user != null) {
      //     Provider.of<UserData>(context, listen: false).logUser(user);
      //     btnController.success();
      //   } else {
      // context.okAlert(
      //     title: AppLocalizations.of(context)!.invalid,
      //     message: AppLocalizations.of(context)!.invalidEmail_Pass);
      //     btnController.reset();
      //   }
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
        appBar: BaseAppBar(
            appBar: AppBar(), widgetContext: context, showBackButton: false),
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
                    height: 0.07,
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
                  hintText: '*******************',
                ),
                const SizedBox(height: 100),
                CustomLoadingButton(
                    controller: _loginBtnController,
                    // text: AppLocalizations.of(context)!.logIn,
                    text: 'Login',
                    onPressed: () => loginValidation(_loginBtnController)),
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
                      child: Image.asset('images/google.png'),
                    ),
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
                      child: Image.asset('images/linkedin.png'),
                    )
                  ],
                ),
                const SizedBox(height: 20),
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
                        context.navigateTo(const SignupView());
                      },
                      child: const Text('Register Now',
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
        ));
  }
}
