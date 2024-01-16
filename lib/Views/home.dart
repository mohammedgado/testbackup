import 'package:dubai_recruitment/Managers/LayoutManager.dart';
import 'package:dubai_recruitment/Views/Shared/AppBar.dart';
import 'package:dubai_recruitment/Views/Shared/searchField.dart';
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
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 30),
        child: ListView(
          children: [SearchInput()],
        ),
      ),
    );
  }
}
