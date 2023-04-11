// ignore_for_file: override_on_non_overriding_member, non_constant_identifier_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_huixin_app/cubit/auth/update_user/update_user_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/signin/signin_ui.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../data/models/auth/requests/update_profile_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/button.dart';
import '../../widgets/profile_form.dart';

class ProfileDetailPage extends StatefulWidget {
  static const String routeName = '/profile_detail';
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  File? _image;

  DataUser? user;

  late String? username = '';
  late String? password = '';
  late String? noMember = '';
  late String? fullName = '';
  late String? email = '';

  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  TextEditingController? _noMemberController;
  TextEditingController? _fullNameController;
  TextEditingController? _emailController;

  /// Initialize Global Key
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _noMemberController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _getUser();
  }

  @override
  void dispose() {
    _usernameController!.dispose();
    _passwordController!.dispose();
    _noMemberController!.dispose();
    _fullNameController!.dispose();
    _emailController!.dispose();

    super.dispose();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {
      username = user?.userName;
      password = user?.passwordText;
      noMember = user?.noMember;
      fullName = user?.fullName;
      email = user?.email;

      _emailController!.text = email ?? '';
      _usernameController!.text = username ?? '';
      _passwordController!.text = '';
      _noMemberController!.text = noMember ?? '';
      _fullNameController!.text = fullName ?? '';
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
    return BlocListener<UpdateUserCubit, UpdateUserState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          error: (error) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: 'Something went wrong, please try again later',
              ),
            );
          },
          loaded: (user) async {
            if (context.mounted) {
              SuccessDialog(
                context: context,
                desc:
                    'Profile has been updated, for the changes to take effect, we`ll need to log you out.',
                title: 'Success',
                btnOkOnPress: () {
                  AppSecureStorage.deleteAll().then(
                    (value) {
                      context.read<UserCubit>().clearUser();

                      GoogleSignIn().disconnect();

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginPage.routeName,
                        (route) => false,
                      );
                    },
                  );
                },
                btnOkText: 'OK',
              ).show();
            }
          },
        );
      },
      child: BlocBuilder<UpdateUserCubit, UpdateUserState>(
        builder: (context, state) {
          return LoaderOverlay(
            child: Scaffold(
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
                        controller: _usernameController,
                        hintText: 'Username',
                      ),
                      Space,
                      ProfileForm(
                        name: 'email',
                        obscureTextEnabled: 'false',
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      Space,
                      ProfileForm(
                        name: 'password',
                        obscureTextEnabled: 'false',
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      Space,
                      ProfileForm(
                        name: 'noMember',
                        obscureTextEnabled: 'false',
                        controller: _noMemberController,
                        hintText: 'No Member',
                      ),
                      Space,
                      ProfileForm(
                        name: 'fullName',
                        obscureTextEnabled: 'false',
                        controller: _fullNameController,
                        hintText: 'Full Name',
                      ),
                      Space,
                      const ProfileFormDate(
                        name: 'birth_date',
                        label: 'Birth date',
                      ),
                      const Spacer(),
                      PrimaryButton(
                        text: state.maybeMap(
                          loading: (_) => 'Loading',
                          orElse: () => 'Update',
                        ),
                        onPressed: () {
                          context.loaderOverlay.show();
                          context
                              .read<UpdateUserCubit>()
                              .updateUser(
                                UpdateProfileRequestModel(
                                  user_id: user?.userId ?? '',
                                  full_name: _fullNameController!.text,
                                  user_name: _usernameController!.text,
                                  user_password:
                                      _passwordController!.text.isEmpty
                                          ? password!
                                          : _passwordController!.text,
                                  no_member: _noMemberController!.text,
                                  birth_date: '2012-02-02',
                                  token_device: user?.tokenDevice ?? '',
                                  token_api: user?.tokenApi ?? '',
                                  fcm_id: user?.fcmId ?? '',
                                  email: _emailController!.text,
                                  user_npp: user?.userNpp ?? '',
                                  img_file: _image,
                                ),
                              )
                              .then((value) => context.loaderOverlay.hide())
                              .onError((error, stackTrace) =>
                                  context.loaderOverlay.hide());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imagePicker() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: _image == null
              ? CachedNetworkImage(
                  imageUrl: user?.imgFile == null
                      ? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
                      : 'https://huixin.id/assets/fileuser/${user?.imgFile}',
                  imageBuilder: (context, imageProvider) => Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 160.0,
                      height: 160.0,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
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
