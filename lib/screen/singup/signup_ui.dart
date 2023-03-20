// ignore_for_file: override_on_non_overriding_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/button.dart';
import 'package:huixinapp/widget/register_form.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  File? _image;

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
      resizeToAvoidBottomInset: false,
      appBar: AppBarDefault(
        title: "Signup",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imagePicker(),
          const SizedBox(
            height: 20.0,
          ),
          const RegisterForm(
            label: 'Username',
            obscureTextEnabled: 'false',
          ),
          const SizedBox(
            height: 10.0,
          ),
          const RegisterForm(
            label: 'Password',
            obscureTextEnabled: 'true',
            obscureToggle: true,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const RegisterForm(
            label: 'No Member',
            obscureTextEnabled: 'false',
          ),
          const SizedBox(
            height: 10.0,
          ),
          const RegisterForm(
            label: 'Full Name',
            obscureTextEnabled: 'false',
          ),
          const SizedBox(
            height: 10.0,
          ),
          const RegisterForm(
            label: 'Birth Date',
            obscureTextEnabled: 'false',
          ),
          const SizedBox(
            height: 20.0,
          ),
          PrimaryButton(
            text: 'SUBMIT',
            onPressed: () {
              Navigator.pushNamed(context, '/home');
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
