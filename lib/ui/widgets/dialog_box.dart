// ignore_for_file: annotate_overrides, overridden_fields

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';

class ErrorDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;

  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  ErrorDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnCancelText,
    this.btnOkOnPress,
    this.btnCancelOnPress,
  }) : super(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.error,
          title: title,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          desc: desc,
          btnOkText: btnOkText,
          btnOkColor: AppColors.yellowColor,
          btnCancelText: btnCancelText,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          dialogBackgroundColor: AppColors.bottom,
        );
}

class PromptDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;

  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  PromptDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnCancelText,
    this.btnOkOnPress,
    this.btnCancelOnPress,
  }) : super(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.warning,
          title: title,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          desc: desc,
          btnOkText: btnOkText,
          btnCancelText: btnCancelText,
          btnOkOnPress: btnOkOnPress,
          btnCancelOnPress: btnCancelOnPress,
          dialogBackgroundColor: AppColors.yellowColor,
        );
}

class SuccessDialog extends AwesomeDialog {
  final BuildContext context;
  final String title;
  final String desc;
  final String? btnOkText;
  final String? btnCancelText;

  final void Function()? btnOkOnPress;
  final void Function()? btnCancelOnPress;

  SuccessDialog({
    required this.context,
    required this.title,
    required this.desc,
    this.btnOkText,
    this.btnCancelText,
    this.btnOkOnPress,
    this.btnCancelOnPress,
  }) : super(
          context: context,
          animType: AnimType.bottomSlide,
          dialogType: DialogType.success,
          title: title,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          descTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          desc: desc,
          btnOkText: btnOkText,
          btnCancelText: btnCancelText,
          btnOkOnPress: btnOkOnPress,
          btnOkColor: AppColors.yellowColor,
          btnCancelOnPress: btnCancelOnPress,
          dialogBackgroundColor: AppColors.greenColor,
          dismissOnBackKeyPress: false,
          dismissOnTouchOutside: false,
        );
}
