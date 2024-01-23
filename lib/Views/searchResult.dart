import 'package:flutter/material.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/chips.dart';
import 'package:recruitment/Views/Shared/jobCard.dart';
import 'package:recruitment/Views/Shared/searchField.dart';
import 'package:recruitment/Helper/Constants.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  @override
  Widget build(BuildContext context) {
    final layoutManager = LayoutManager(context);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: layoutManager.mainHorizontalPadding(), vertical: 16),
        child: ListView(
          children: [
            const SearchInput(
              isBlue: true,
              text: 'Front end developer',
            ),
            const SizedBox(height: 8),
            const SearchInput(
              isBlue: true,
              isLocation: true,
              text: 'Tronto, Canada',
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: appDesign.colorPrimary,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          splashColor: Colors.grey[500],
                          onTap: () {
                            // context.navigateTo(const NotificationsView());
                          },
                          child: Image.asset(
                            'images/adjustments.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const TextChip(
                    text: 'Date Posted',
                    isType2: true,
                  ),
                  const TextChip(
                    text: 'Experience',
                    isType2: true,
                  ),
                  const TextChip(
                    text: 'Job Type',
                    isType2: true,
                  ),
                ],
              ),
            ),
            const JobCard(),
            const JobCard(),
            const JobCard(),
            const JobCard(),
          ],
        ),
      ),
    );
  }
}
