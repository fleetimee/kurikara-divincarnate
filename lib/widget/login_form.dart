import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  final String label;
  final String obscureText;

  const LoginForm({
    Key? key,
    required this.label,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: FormBuilderTextField(
        obscureText: obscureText == 'true',
        name: label.toLowerCase().replaceAll(' ', '_'),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        cursorColor: Colors.black,
        cursorHeight: 20,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: const Text(''),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15, // reduce the vertical padding
            horizontal: 50, // add horizontal padding
          ),
          focusColor: Colors.red,
          fillColor: Colors.white,
          hoverColor: Colors.red,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black45),
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
            color: Colors.black45,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ),
        textInputAction: TextInputAction.next,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          if (label == 'Email') FormBuilderValidators.email(),
        ]),
      ),
    );
  }
}
