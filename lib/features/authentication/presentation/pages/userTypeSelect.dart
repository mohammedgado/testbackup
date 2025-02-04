import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/core/layoutHelpers/LayoutHelper.dart';
import 'package:dubai_recruitment/features/authentication/presentation/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:provider/provider.dart';
import '../../../../core/layoutHelpers/responsive.dart';
import '../../../../core/widgets/appBar.dart';

class UserTypeSelectView extends StatefulWidget {
  const UserTypeSelectView({super.key});

  @override
  State<UserTypeSelectView> createState() => _UserTypeSelectViewState();
}

class _UserTypeSelectViewState extends State<UserTypeSelectView> {
  bool isCandidate = false;
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
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    isCandidate = true;
                    UserData.userType = 1;
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
                    UserData.userType = 2;
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
