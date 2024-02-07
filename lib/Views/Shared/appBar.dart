import 'package:recruitment/Extensions/extensions.dart';
// import 'package:recruitment/Views/notificationsView.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Views/messages.dart';
import 'package:recruitment/Views/myAccountCompany.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final BuildContext widgetContext;
  final bool? showBackButton;
  final bool? showSearch;
  final bool? showNotification;
  final bool? showLogo;
  final bool? hideElevation;
  final bool? hideActions;

  BaseAppBar(
      {required this.appBar,
      required this.widgetContext,
      required this.showBackButton,
      this.hideElevation,
      this.showLogo,
      this.showSearch,
      this.showNotification,
      this.hideActions});

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
      actions: hideActions != null && hideActions == true
          ? null
          : [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.grey[500],
                    onTap: () {
                      context.navigateTo(const MessagesView());
                    },
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.email_outlined,
                            color: appDesign.colorPrimary,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 10,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFF14336),
                              shape: OvalBorder(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.grey[500],
                    onTap: () {
                      context.navigateTo(const MyAccountView());
                    },
                    child: const Icon(
                      Icons.person_outline,
                      color: appDesign.colorPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
