import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/delete_user/delete_user_cubit.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/delete_user_request_model.dart';
import 'package:flutter_huixin_app/ui/pages/profile/detail_profile_ui.dart';
import 'package:flutter_huixin_app/ui/pages/profile/information_ui.dart';
import 'package:flutter_huixin_app/ui/pages/signin/signin_ui.dart';
import 'package:flutter_huixin_app/ui/widgets/dialog_box.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/stats.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/navigator_style.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DataUser? user;

  @override
  void initState() {
    super.initState();

    _getUser();
    context.read<ActiveStudentCubit>().getActiveStudent();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<XpCubit>().getXp(user?.userId ?? '');
      context.read<DailyActivityCubit>().getDailyActivity(user?.userId ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          loaded: (value) {
            AppSecureStorage.deleteAll();

            GoogleSignIn().signOut();

            GoogleSignIn().disconnect();

            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginPage.routeName,
              (route) => false,
            );

            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                message: 'User deleted successfully',
              ),
            );
          },
        );
      },
      child: LoaderOverlay(
        child: Scaffold(
          appBar: AppBarDefault(
            title: "Profile",
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InkWell(
                          child: profileUser(),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProfileDetailPage.routeName);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      information(context),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Statistics',
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          height: 125,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.5,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: allStats.length,
                            itemBuilder: (context, index) {
                              return Builder(
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 4,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            allStats[index].imageUrl,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  allStats[index].title !=
                                                          'Activity'
                                                      ? context.select(
                                                          (XpCubit xpCubit) =>
                                                              xpCubit.state
                                                                  .maybeMap(
                                                            orElse: () => '..',
                                                            loaded: (state) =>
                                                                state
                                                                    .data
                                                                    .data
                                                                    ?.first
                                                                    .jmlXp
                                                                    .toString() ??
                                                                '..',
                                                          ),
                                                        )
                                                      : context.select(
                                                          (DailyActivityCubit
                                                                  dailyActivityCubit) =>
                                                              dailyActivityCubit
                                                                  .state
                                                                  .maybeMap(
                                                            orElse: () => '..',
                                                            loaded: (state) =>
                                                                state
                                                                    .data
                                                                    .data
                                                                    ?.first
                                                                    .jmlDaily
                                                                    .toString() ??
                                                                '..',
                                                          ),
                                                        ),
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  allStats[index].title,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Friends',
                            style: TextStyle(
                              fontSize: 36,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: friend(context),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            logout(context),
                            TextButton(
                              onPressed: () {
                                PromptDialog(
                                  context: context,
                                  title: 'Delete Account',
                                  desc:
                                      'Are you sure want to delete your account?',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () async {
                                    // await AppSecureStorage.deleteUser();
                                    // Navigator.pushNamedAndRemoveUntil(
                                    //     context, LoginPage.routeName, (route) => false);

                                    ErrorDialog(
                                      context: context,
                                      title: 'LAST WARNING',
                                      desc: 'ARE YOU SURE ?',
                                      btnOkOnPress: () {
                                        context.loaderOverlay.show();

                                        context
                                            .read<DeleteUserCubit>()
                                            .deleteUser(
                                              DeleteUserRequestModel(
                                                userId: user?.userId ?? '',
                                              ),
                                            )
                                            .then((value) =>
                                                context.loaderOverlay.hide())
                                            .onError((error, stackTrace) =>
                                                context.loaderOverlay.hide());
                                      },
                                      btnOkText:
                                          'I hereby confirm that I want to delete my account',
                                    ).show();
                                  },
                                ).show();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.greyWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Remove Account',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const NavigatorBar(
            currentIndex: 2,
          ),
        ),
      ),
    );
  }

  Widget profileUser() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderform,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Add the mainAxisAlignment property
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.fullName ?? '..',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  user?.userName ?? '..',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/clock.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Joined March 2023',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // CircleAvatar(
          //   radius: 50,
          //   backgroundImage: NetworkImage(
          //       'https://huixin.id/assets/fileuser/${user?.imgFile ?? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'}'),
          //   backgroundColor: Colors.grey,
          // )
          CachedNetworkImage(
            imageUrl: user?.imgFile == null
                ? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
                : 'https://huixin.id/assets/fileuser/${user?.imgFile}',
            imageBuilder: (context, imageProvider) => Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Icon(Icons.error),
            ),
          )
        ],
      ),
    );
  }

  Widget information(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 80,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: AppColors.borderform,
            width: 3,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              InformationPage.routeName,
              arguments: {
                'user': user?.userId,
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/info.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              // const SizedBox(width: 10),
              const Text(
                'Announcement and Information',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.borderform,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget friend(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: AppColors.borderform,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 40,
            padding: const EdgeInsets.only(left: 50),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.orange,
                  width: 3,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                'FOLLOWING',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.yellowColor1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          listfriend(),
        ],
      ),
    );
  }

  Widget listfriend() {
    return BlocBuilder<ActiveStudentCubit, ActiveStudentState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: SizedBox.shrink(),
          ),
          loading: () => const Center(
            child: SizedBox(
              height: 120,
              width: 330,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          loaded: (data) {
            return SizedBox(
              height: 120,
              width: 330,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 10,
                    minVerticalPadding: -15,
                    // leading: CircleAvatar(
                    //   child: RandomAvatar(
                    //     data.data![index].fullName ?? '..',
                    //     height: 40,
                    //     width: 40,
                    //   ),
                    // ),
                    leading: CachedNetworkImage(
                      imageUrl: data.data![index].imgFile == null
                          ? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
                          : 'https://huixin.id/assets/fileuser/${data.data![index].imgFile}',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: const Icon(Icons.error),
                      ),
                    ),
                    title: Text(
                      data.data![index].fullName ?? '..',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      '${data.data![index].jmlAktivitas} XP',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (message) => Center(
            child: Text(message),
          ),
        );
      },
    );
  }

  Widget logout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () {
          PromptDialog(
            context: context,
            title: 'Logout',
            desc: 'Are you sure want to logout?',
            btnOkText: 'YES',
            btnCancelText: 'NO',
            btnCancelOnPress: () {},
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
          ).show();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/door.png'),
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text(
              'Log Out',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
