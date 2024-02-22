import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
import '../../../../core/widgets/appBar.dart';
import '../../../company/presentation/pages/companyProfile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
          const ListTile(
            title: Text(
              'Username',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: const Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'Phone number',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'Education',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'Work Experience',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
          const ListTile(
            title: Text(
              'Password',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                fontFamily: 'Inter',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            shape: Border(
              bottom: BorderSide(width: 1),
            ),
          ),
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
          MaterialButton(
            child: Text('Company Profile'),
            onPressed: () {
             // context.navigateTo(CompanyProfileView());
            },
          )
        ],
      ),
    );
  }
}
