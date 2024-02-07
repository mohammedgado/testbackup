import 'package:flutter/material.dart';
import 'package:recruitment/Extensions/extensions.dart';
import 'package:recruitment/Helper/Constants.dart';
import 'package:recruitment/Managers/LayoutManager.dart';
import 'package:recruitment/Views/Shared/AppBar.dart';
import 'package:recruitment/Views/Shared/appListTile.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

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
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('images/profile.jpg'),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      // chooseImage();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90.0),
                        color: appDesign.colorAccent,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
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
          appListTile('Username', () {}),
          appListTile('Email', () {}),
          appListTile('Phone number', () {}),
          appListTile('Job Title', () {}),
          appListTile('About', () {}),
          appListTile('Education', () {}),
          appListTile('Work experience', () {}),
          appListTile('Password', () {}),
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
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
