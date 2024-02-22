import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/appListTile.dart';
import 'candidateCareerInfo.dart';
import 'candidatePersonalInfo.dart';

class MyAccountCandidateView extends StatelessWidget {
  const MyAccountCandidateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('images/profile.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'LinkYou Candidate',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Personal Info', () {
            context.navigateTo(const CandidatePersonalView());
          }),
          appListTile('Career Info', () {
            context.navigateTo(const CandidateCareerView());
          }),
          // appListTile('Settings', () {
          //   context.navigateTo(const CandidateCareerView());
          // }),
          const ListTile(
            title: Text(
              'Delete account',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              'Sign out',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: const Icon(
              Icons.logout,
              color: appDesign.colorPrimary,
            ),
            shape: const Border(
              bottom: BorderSide(width: 1),
            ),
          ),
        ],
      ),
    );
  }
}
