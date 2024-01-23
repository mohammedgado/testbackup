import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/jobCard.dart';
import 'package:recruitment/Views/Shared/searchField.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      appBar: BaseAppBar(
          appBar: AppBar(), widgetContext: context, showBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 16),
        child: ListView(
          children: const [
            SearchInput(),
            SizedBox(height: 8),
            SearchInput(
              isLocation: true,
            ),
            JobCard(),
            JobCard(),
          ],
        ),
      ),
    );
  }
}
