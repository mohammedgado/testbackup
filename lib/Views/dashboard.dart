import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/dashboardItem.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Recruitment Dashboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: appDesign.colorPrimary),
            ),
          ),
          const SizedBox(height: 20),
          dashboardItem(
              "Job posts", const Color(0xFF86C157), Icons.edit_square, '10+'),
          dashboardItem(
              "Job Views", const Color(0xFF008DC9), Icons.visibility, '200+'),
          dashboardItem(
              "Job applicants", Colors.amberAccent, Icons.paste, '150+'),
          dashboardItem("Candidates saved", const Color(0xFFA869D6),
              Icons.contact_mail, '50+'),
        ],
      ),
    );
  }
}
