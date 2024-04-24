import 'dart:convert';
import 'dart:io';

import 'package:dubai_recruitment/core/Managers/ImagePickerManager.dart';
import 'package:dubai_recruitment/core/constants/userData.dart';
import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:dubai_recruitment/features/authentication/data/models/user.dart';
import 'package:dubai_recruitment/features/profile/data/data_sources/profileDataSource.dart';
import 'package:dubai_recruitment/features/profile/presentation/pages/editInfo.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../../core/widgets/appListTile.dart';

class CandidatePersonalView extends StatefulWidget {
  const CandidatePersonalView({super.key});

  @override
  State<CandidatePersonalView> createState() => _CandidatePersonalViewState();
}

class _CandidatePersonalViewState extends State<CandidatePersonalView> {
  updateProfile() async {
    var res = await ProfileDataSource().getProfile();
    print('Updated Profile');
    User user = User.fromJson(res.data['data']);
    setState(() {
      Provider.of<UserData>(context, listen: false)
          .logUser(user, UserData.token);
    });
  }

  ImagePickerManager imagePicker = ImagePickerManager();
  updateImage() async {
    File? imagePicked = await imagePicker.pickOneImageFile();
    if (imagePicked != null) {
      await ProfileDataSource().updateUserImage(imagePicked);
      updateProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        widgetContext: context,
        showBackButton: true,
        showLogo: false,
        hideActions: true,
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
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.grey)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.memory(
                      base64Decode(
                          UserData().userInfo.userImage!.split('base64,')[1]),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      // chooseImage();
                      updateImage();
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
          Text(
            Provider.of<UserData>(context, listen: false).userInfo.fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
                color: appDesign.colorPrimary),
          ),
          const SizedBox(height: 24),
          appListTile('Username', () {
            context.navigateTo(
              EditInfoView(
                refresh: updateProfile,
                title: 'Username:',
                type: 'name',
                oldValue: Provider.of<UserData>(context, listen: false)
                    .userInfo
                    .fullName,
              ),
            );
          }),
          appListTile('Email', () {
            context.navigateTo(
              EditInfoView(
                refresh: updateProfile,
                title: 'Email:',
                type: 'email',
                oldValue: Provider.of<UserData>(context, listen: false)
                    .userInfo
                    .email,
              ),
            );
          }),
          appListTile('Phone number', () {
            context.navigateTo(
              EditInfoView(
                refresh: updateProfile,
                title: 'Phone:',
                type: 'phone',
                oldValue: Provider.of<UserData>(context, listen: false)
                    .userInfo
                    .phone,
              ),
            );
          }),
          // appListTile('About', () {}),
          appListTile('Password', () {
            context.navigateTo(
              EditInfoView(
                refresh: updateProfile,
                title: 'Password:',
                type: 'password',
                oldValue: '*****',
              ),
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
