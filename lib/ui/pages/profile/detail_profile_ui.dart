// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

import 'package:image_picker/image_picker.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/button.dart';
import '../../widgets/profile_form.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  File? _image;

  DataUser? user;

  late String? username;
  String? password;
  String? noMember;
  String? fullName;

  TextEditingController? _usernameController;

  /// Initialize Global Key
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    username = 'Loading...';

    setState(() {
      username = user?.userName;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  var Space = const SizedBox(
    height: 25.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarReading(
        title: 'Profile',
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imagePicker(),
              Space,
              ProfileForm(
                name: 'username',
                obscureTextEnabled: 'false',
                controller: _usernameController = TextEditingController(
                  text: username,
                ),
              ),
              Space,
              const ProfileForm(
                name: 'password',
                obscureTextEnabled: 'true',
                obscureToggle: true,
                initialValue: '123456',
              ),
              Space,
              const ProfileForm(
                name: 'noMember',
                obscureTextEnabled: 'false',
                initialValue: '123456',
              ),
              Space,
              const ProfileForm(
                name: 'fullName',
                obscureTextEnabled: 'false',
                initialValue: 'Ahmad TaftaZani',
              ),
              Space,
              const ProfileFormDate(
                name: 'birth_date',
                label: 'Birth date',
              ),
              const Spacer(),
              PrimaryButton(
                text: 'SUBMIT',
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
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
}
