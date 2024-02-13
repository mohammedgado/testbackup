import 'package:flutter/material.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/appListTile.dart';

class CandidateCareerView extends StatelessWidget {
  const CandidateCareerView({super.key});

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
            'LinkYou User',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Job Title', () {}),
          appListTile('Education', () {}),
          appListTile('Work experience', () {}),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
