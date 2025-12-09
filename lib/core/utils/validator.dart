import 'package:Ecommerce/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Validator {
  String? validateEmail(String input, BuildContext context) {
    if (input.isEmpty) {
      return context.l10n.pleaseEnterYourEmail;
    } else if (!RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(input)) {
      return context.l10n.emailMustBeLikeThisExampleGmailCom;
    }
    return null;
  }

  String? validatePassword(String input, BuildContext context) {
    if (input.isEmpty) {
      return context.l10n.pleaseEnterYourPassword;
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    ).hasMatch(input)) {
      return context.l10n.passwordMustContainUpperLowerAndSpecialCharacter;
    }
    return null;
  }

  String? validateConfirmPassword(
    String input,
    String password,
    BuildContext context,
  ) {
    if (input.isEmpty || input != password) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
  }

  String? validateName(String name, BuildContext context) {
    if (name.isEmpty) {
      return context.l10n.pleaseEnterName;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return context.l10n.nameMustBeMoreThan3Characters;
    } else {
      return null;
    }
  }

  String? validatePhone(String value, BuildContext context) {
    if (value.isEmpty) {
      return context.l10n.pleaseEnterYourPhoneNumber;
    } else if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value)) {
      // Egyptian phone validation
      return context.l10n.enterAValidEgyptianPhoneNumber;
    }
    return null;
  }
}
