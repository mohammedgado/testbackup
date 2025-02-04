import 'package:dubai_recruitment/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidatorHandler {
  final BuildContext context;

  ValidatorHandler(this.context);

  String? validateName(String? name) {
    if (name == null || !name.isValidName()) {
      return AppLocalizations.of(context)!.name3Message;
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || !email.isValidEmail()) {
      return AppLocalizations.of(context)!.emailValid;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.length < 8) {
      return AppLocalizations.of(context)!.passMustBe;
    }
    return null;
  }

  String? validateConfirmPassword(String? password, String? confirmPass) {
    if (password != confirmPass) {
      return AppLocalizations.of(context)!.confirmPassError;
    }
    return null;
  }

  String? validateNumber(String? number) {
    if (number == null || number.length < 8) {
      return AppLocalizations.of(context)!.numberMustBe;
    }
    return null;
  }
}
