import 'package:recruitment/Extensions/extensions.dart';
// import 'package:recruitment/Views/notificationsView.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recruitment/Helper/Constants.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final BuildContext widgetContext;
  final bool? showBackButton;
  final bool? showSearch;
  final bool? showNotification;
  final bool? showLogo;
  final bool? hideElevation;

  BaseAppBar(
      {required this.appBar,
      required this.widgetContext,
      required this.showBackButton,
      this.hideElevation,
      this.showLogo,
      this.showSearch,
      this.showNotification});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: hideElevation != null && hideElevation == true ? 0 : 2,
      shadowColor: Colors.grey.shade100,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: false,
      leading: showBackButton != null && showBackButton!
          ? Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: showBackButton!,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(50),
                  //   color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       blurRadius: 4,
                  //       spreadRadius: 0,
                  //       color: Colors.black.withAlpha(38),
                  //       offset: const Offset(0, 1),
                  //     ),
                  //   ],
                  // ),
                  child: Material(
                    color: Colors.transparent,
                    child: BackButton(
                        color: appDesign.colorPrimaryDark,
                        onPressed: () {
                          Navigator.of(
                                  Constant.navigatorKey.currentState!.context)
                              .pop();
                        }),
                  ),
                ),
              ),
            )
          : null,
      title: Visibility(
        visible: showLogo ?? true,
        child: SizedBox(
            width: 104, height: 25, child: Image.asset("images/logo.png")),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 4,
              //     spreadRadius: 0,
              //     color: Colors.black.withAlpha(38),
              //     offset: const Offset(0, 1),
              //   ),
              // ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.grey[500],
                onTap: () {
                  // context.navigateTo(const NotificationsView());
                },
                child: const Icon(
                  Icons.email_outlined,
                  color: appDesign.colorPrimary,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 4,
              //     spreadRadius: 0,
              //     color: Colors.black.withAlpha(38),
              //     offset: const Offset(0, 1),
              //   ),
              // ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.grey[500],
                onTap: () {
                  // context.navigateTo(const NotificationsView());
                },
                child: const Icon(
                  Icons.person_outline,
                  color: appDesign.colorPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
