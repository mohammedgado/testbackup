import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/userData.dart';
import '../../../job/presentation/pages/findJobHome.dart';


class AuthenticationService extends StatefulWidget {
  const AuthenticationService({super.key});

  @override
  State<AuthenticationService> createState() => _AuthenticationServiceState();
}

class _AuthenticationServiceState extends State<AuthenticationService> {
  // @override
  // void initState() {
  // super.initState();
  // loadData();
  // }

  // loadData() async {
  //   await Provider.of<UserData>(context, listen: false).loadUserData();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(
      builder: (context, userData, child) {
        //return userData.userInfo.id == 0 ? const LoginView() : const HomeView();
        return  FindJobHomeView();
      },
    );
  }
}
