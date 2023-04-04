// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:image_picker/image_picker.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/button.dart';
import '../../widgets/register_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// Initialize FormBuilder global key
  /// that will be used to validate form
  /// and store it in [_fbKey] variable

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  /// Initialize File variable for image picker
  @override
  File? _image;

  /// Initialize Image Picker
  /// that will be used to pick image from gallery or camera
  /// and store it in [_image] variable
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: "Signup",
      ),
      body: FormBuilder(
        key: _fbKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    _imagePicker(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RegisterForm(
                        name: 'username',
                        label: 'Username',
                        obscureTextEnabled: 'false',
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(
                              6,
                              allowEmpty: false,
                              errorText:
                                  'Username must be at least 6 characters',
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RegisterForm(
                      name: 'password',
                      label: 'Password',
                      obscureTextEnabled: 'true',
                      obscureToggle: true,
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                            errorText: 'Password is required',
                          ),
                          FormBuilderValidators.minLength(
                            6,
                            allowEmpty: false,
                            errorText: 'Password must be at least 6 characters',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RegisterForm(
                      name: 'noMember',
                      label: 'No Member',
                      obscureTextEnabled: 'false',
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RegisterForm(
                      name: 'fullName',
                      label: 'Full Name',
                      obscureTextEnabled: 'false',
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const RegisterForm(
                      name: 'birthDate',
                      label: 'Birth Date',
                      obscureTextEnabled: 'false',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: 'SUBMIT',
                      onPressed: () {
                        if (_fbKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_fbKey.currentState?.value.toString());
                        } else {
                          debugPrint(_fbKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Or Sign Up With',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    _buildSocialIcon(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePicker() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: _image == null
              ? CircleAvatar(
                  radius: 80,
                  child: Image.asset(
                    "assets/images/photo-placeholder.png",
                    fit: BoxFit.fill,
                  ),
                )
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(_image!),
                ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 10,
          right: MediaQuery.of(context).size.width / 2 - 80,
          child: GestureDetector(
            child: Image.asset(
              "assets/images/photo-picker.png",
              fit: BoxFit.fill,
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SafeArea(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text('Take a picture'),
                          onTap: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.camera);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.image),
                          title: const Text('Select from gallery'),
                          onTap: () {
                            Navigator.of(context).pop();
                            _pickImage(ImageSource.gallery);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/register-google.png",
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 40,
        ),
        Image.asset(
          "assets/images/register-facebook.png",
          width: 50,
          height: 50,
        ),
        const SizedBox(
          width: 40,
        ),
        Image.asset(
          "assets/images/register-apple.png",
          width: 50,
          height: 50,
        ),
      ],
    );
  }
}
