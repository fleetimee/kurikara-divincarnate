import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/button.dart';
import 'package:huixinapp/widget/register_form.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
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
      body: Container(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imagePicker(),
            const SizedBox(
              height: 20.0,
            ),
            const RegisterForm(
              label: 'UserX123',
              obscureTextEnabled: 'false',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const RegisterForm(
              label: '12345678',
              obscureTextEnabled: 'true',
              obscureToggle: true,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const RegisterForm(
              label: 'H123456',
              obscureTextEnabled: 'false',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const RegisterForm(
              label: 'Ahmad TaftaZani',
              obscureTextEnabled: 'false',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const RegisterForm(
              label: 'Birth Date',
              obscureTextEnabled: 'false',
            ),
            Spacer(),
            PrimaryButton(
              text: 'SUBMIT',
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
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
                    "assets/images/user.png",
                    fit: BoxFit.fill,
                  ),
                )
              : CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(_image!),
                ),
        ),
        Positioned(
          top: 100,
          right: 120,
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
}
