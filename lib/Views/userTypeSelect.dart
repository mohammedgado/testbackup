import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Helper/responsive.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recruitment/Views/signup.dart';

class UserTypeSelectView extends StatefulWidget {
  const UserTypeSelectView({super.key});

  @override
  State<UserTypeSelectView> createState() => _UserTypeSelectViewState();
}

class _UserTypeSelectViewState extends State<UserTypeSelectView> {
  bool isCandidate = false;
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
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
              'Choose your account type',
              textAlign: TextAlign.center,
              style: TextStyle(
                // color: Color(0xFF919191),
                fontSize: 22,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    isCandidate = true;
                  }),
                  child: Container(
                    height: Dimensions.widthPercentage(context, 40),
                    width: Dimensions.widthPercentage(context, 40),
                    decoration: BoxDecoration(
                      border: isCandidate
                          ? Border.all(color: appDesign.colorAccent, width: 2)
                          : null,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: appDesign.colorPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Candidate',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: '.SF Arabic',
                              fontSize: Dimensions.fontSize(context, 1.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.widthPercentage(context, 5.9)),
                InkWell(
                  onTap: () => setState(() {
                    isCandidate = false;
                  }),
                  child: Container(
                    height: Dimensions.widthPercentage(context, 40),
                    width: Dimensions.widthPercentage(context, 40),
                    decoration: BoxDecoration(
                      border: isCandidate
                          ? null
                          : Border.all(color: appDesign.colorAccent, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          child: Icon(
                            Icons.corporate_fare,
                            color: appDesign.colorPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Employer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: '.SF Arabic',
                              fontSize: Dimensions.fontSize(context, 1.5),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            MaterialButton(
              height: 48,
              onPressed: () {
                context.navigateTo(const SignupView());
              },
              color: appDesign.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
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
