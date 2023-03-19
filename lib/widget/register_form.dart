import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  final String label;
  final String obscureTextEnabled;
  final bool obscureToggle;
  final bool dateTimePickerEnabled;
  final String dateTimePickerLabel;

  const RegisterForm({
    Key? key,
    required this.label,
    required this.obscureTextEnabled,
    this.obscureToggle = false,
    this.dateTimePickerEnabled = false,
    this.dateTimePickerLabel = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: FormBuilderTextField(
        obscureText: obscureTextEnabled == 'true',
        name: label.toLowerCase().replaceAll(' ', '_'),
        style: TextStyle(
          color: const Color(0xFF8C2828),
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
            borderSide: const BorderSide(color: Color(0xFF8C2828)),
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
          suffixIcon: obscureToggle
              ? IconButton(
                  icon: Icon(obscureTextEnabled == 'true'
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {},
                )
              : null,
          labelText: dateTimePickerEnabled ? dateTimePickerLabel : null,
        ),
        textInputAction: TextInputAction.next,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          if (label == 'Email') FormBuilderValidators.email(),
        ]),
        keyboardType: dateTimePickerEnabled ? TextInputType.datetime : null,
        inputFormatters: dateTimePickerEnabled
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        onTap: () {
          if (dateTimePickerEnabled) {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                // Do something with the selected date
              }
            });
          }
        },
      ),
    );
  }
}
