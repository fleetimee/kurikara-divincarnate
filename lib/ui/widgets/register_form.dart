import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

// import intl
import 'package:intl/intl.dart';

import '../../common/constants/color.dart';

class RegisterForm extends StatelessWidget {
  final String name;
  final String label;
  final String obscureTextEnabled;
  final bool obscureToggle;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? initialValue;

  const RegisterForm({
    Key? key,
    required this.name,
    required this.label,
    required this.obscureTextEnabled,
    this.obscureToggle = false,
    this.validator,
    this.keyboardType,
    this.controller,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: FormBuilderTextField(
        obscureText: obscureTextEnabled == 'true',
        name: name,
        controller: controller,
        initialValue: initialValue,
        style: TextStyle(
          color: AppColors.darkOrange,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        cursorHeight: 20,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const Text(''),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15, // reduce the vertical padding
            // horizontal: 50, // add horizontal padding
          ),
          focusColor: Colors.red,
          fillColor: Colors.white,
          hoverColor: Colors.red,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.darkOrange),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: label,
          hintStyle: TextStyle(
            color: const Color(0x808C2828),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ),
        textInputAction: TextInputAction.next,
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}

class RegisterFormDate extends StatelessWidget {
  final String name;
  final String label;
  final TextEditingController? controller;

  const RegisterFormDate({
    super.key,
    required this.name,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: FormBuilderDateTimePicker(
        name: name,
        controller: controller,
        style: TextStyle(
          color: AppColors.darkOrange,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        validator: FormBuilderValidators.required(),
        inputType: InputType.date,
        currentDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        valueTransformer: (date) => date.toString(),
        format: DateFormat('EEEE, MMMM d, yyyy', 'id_ID'),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const Text(''),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/calendar.png",
            ),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15, // reduce the vertical padding
            // horizontal: 50, // add horizontal padding
          ),
          focusColor: Colors.red,
          fillColor: Colors.white,
          hoverColor: Colors.red,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.darkOrange),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: label,
          hintStyle: TextStyle(
            color: const Color(0x808C2828),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ),
      ),
    );
  }
}
