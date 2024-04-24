import 'package:dubai_recruitment/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/constants/constant.dart';
import 'core/constants/userData.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Provider.of<UserData>(context, listen: false).loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserData>(builder: (context, userData, child) {
      return MaterialApp(
        title: 'Dubai Recruitment',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(userData.userLanguage),
        debugShowCheckedModeBanner: false,
        navigatorKey: Constant.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appDesign.colorPrimary),
          useMaterial3: true,
        ),
        home: SplashView(),
      );
    });
  }
}

// a7c347ba9a@emailbbox.pro
// test@Pass123