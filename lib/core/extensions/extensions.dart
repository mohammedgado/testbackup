import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../constants/constant.dart';
import 'package:dubai_recruitment/core/constants/appDesign.dart';
class DatePickerBloc extends ChangeNotifier {
  late String selectedDate;

  void selectDate(String date) {
    selectedDate = date;
    notifyListeners();
  }
}


extension NavigationExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;

  double get screenWidth => screenSize.width;

  // Navigation
  void navigateTo(Widget screen) {
    Navigator.of(Constant.navigatorKey.currentState!.context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
            // appBar: BaseAppBar(
            //     appBar: AppBar(),
            //     widgetContext: Constant.navigatorKey.currentState!.context,
            //     showBackButton: true),
            body: screen),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.easeInCirc;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
    // Navigator.push(
    // this,
    // PageRouteBuilder(
    //   transitionDuration: Duration(milliseconds: 400),
    //   pageBuilder: (context, animation, secondaryAnimation) => screen,
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     var begin = Offset(1.0, 0.0);
    //     var end = Offset.zero;
    //     var curve = Curves.easeInCirc;

    //     var tween =
    //         Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    //     return SlideTransition(
    //       position: animation.drive(tween),
    //       child: child,
    //     );
    //   },
    // ),
    // );
  }

  void routeTo(String name) {
    Navigator.of(this).pushNamed(name);
  }

  void popUpPage(Widget screen) {
    Navigator.push<void>(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds:300 ),
        fullscreenDialog: true,
      ),
    );
  }

  String showDatePicker() {
    DatePickerBloc datePickerBloc = Provider.of<DatePickerBloc>(this, listen: false);
    BottomPicker.date(
      title: '',
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day

      ),
      maxDateTime: DateTime(DateTime.now().year+1,DateTime.now().month+10),
      minDateTime: DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day

      ),
      pickerTextStyle: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),

      onChange: (index) {
        print(index);
      },
      onSubmit: (index) async{
        datePickerBloc.selectDate(index.toString());
        final date = await index;
        return  date;
        print(index);
      },
      buttonSingleColor: appDesign.colorPrimary,

      buttonWidth: 200,
      buttonContent: Center(
        child: Text(
          "Select Date",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
    ).show(this);
    return 'empty';
  }

  String getTimeDifference(String datetime) {
    DateTime parsedDate = DateTime.parse(datetime);
    final now = DateTime.now().toUtc();
    //print("Now Date");
    //print(now);

    Duration difference = parsedDate.difference(now);



    if (difference.inHours.abs() >= 24) {
      // Display difference in days
      int days = difference.inDays.abs();
      return " ${difference.isNegative ? '' : ''}$days ${"day ago"}${days > 1 ? '' : ''}";

    } else  {

      return "today";


    }
  }

  String formatDateMonthDay(String date) {
    DateTime dateTime = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').parse(date);

    return DateFormat('d MMM').format(dateTime);
  }

  //Alerts
  void okAlert({String title = '', String message = '', Function? onDismiss}) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.white,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
              child: Text(
                AppLocalizations.of(context)!.dialogOk,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: appDesign.colorAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onDismiss != null) {
                  onDismiss();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> actionAlert({
    String title = '',
    String message = '',
    required VoidCallback onOkPressed,
  }) async {
    await showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          actions: <Widget>[
            TextButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<Color>(
              //       Colors.grey.shade200,
              //       ),
              //   shape: MaterialStateProperty.all<OutlinedBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //   ),
              // ),
              child: Text(
                AppLocalizations.of(context)!.dialogOk,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: appDesign.colorPrimary,
                ),
              ),
              onPressed: () {
                onOkPressed();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all<Color>(
              //     Colors.grey.shade200,
              //   ),
              //   shape: MaterialStateProperty.all<OutlinedBorder>(
              //     RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //   ),
              // ),
              child: Text(
                // AppLocalizations.of(context)!.dialogCancel,
                'Cancel',
                // "Cancel",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: appDesign.colorAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  String convertNumberToArabic(String number) {
    final Map<String, String> arabicNumbers = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String arabicNumber = '';
    for (int i = 0; i < number.length; i++) {
      final String digit = number[i];
      arabicNumber += arabicNumbers[digit] ?? digit;
    }

    return arabicNumber;
  }
}

//Auth
extension EmailValidator on String {
  bool isValidEmail() {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(this);
  }

  bool isValidName() {
    final RegExp regex = RegExp(r'^[\p{L}\s]{3,100}$', unicode: true);
    return regex.hasMatch(this);
  }

  bool isValidNumber() {
    final RegExp regex = RegExp(r'^[\p{N}]{3,20}$', unicode: true);
    return regex.hasMatch(this);
  }

  // bool isStrongPassword() {
  //   final RegExp regex = RegExp(r'^\s*.{8}\s*$');
  //   print("is Strong");
  //   print(regex.hasMatch(this));
  //   return regex.hasMatch(this);
  // }
}
