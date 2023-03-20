import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';

import '../../data/profile_followers.dart';
import '../../widget/AppBar/appbar_style.dart';
import '../../widget/navigator_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: "Profile",
      ),
      body: Column(
        children: [
          InkWell(
            child: profileUser(),
            onTap: () {
              Navigator.pushNamed(context, '/profile/profiledetail');
            },
          ),
          const SizedBox(
            height: 25,
          ),
          information(context),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'Statistic',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          statistic(),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'Friends',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          friend(context),
          const Spacer(),
          logout(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
        ],
      ),
      bottomNavigationBar: const NavigatorBar(),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ahmad TaftaZani',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const Text(
                  'UserX123',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/user.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }

  Widget information(BuildContext context) {
    return SizedBox(

      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
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
            Navigator.pushNamed(context, '/profile/information');
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
                'Pengumuman untuk peserta ...',
                style: TextStyle(fontSize: 18, color: Colors.black),
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

  Widget statistic() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: AppColors.borderform,
                    width: 3,
                  ),
                ),
                height: 60,
                width: 180,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('13',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text('Daily Activity',
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: AppColors.borderform,
                    width: 3,
                  ),
                ),
                height: 60,
                width: 180,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/crown.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('4',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        Text('Total XP',
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget friend() {
  //   return Column(
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.only(left: 20),
  //         child: const Text(
  //           'Friends',
  //           style: TextStyle(fontSize: 30, color: Colors.black),
  //         ),
  //       ),
  //       Container(
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           children: [
  //             Container(
  //               // alignment: Alignment.center,
  //               padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
  //               width: 350,
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(20),
  //                   topRight: Radius.circular(20),
  //                 ),
  //               ),
  //               child: const Text(
  //                 'Follower',
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(fontSize: 25, color: Colors.orange),
  //               ),
  //             ),
  //             ListView.builder(
  //               itemCount: 1,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return;
  //               },
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

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
            padding: const EdgeInsets.only(left: 50),

            child: Text(
              'Following',
              style: TextStyle(fontSize: 25, color: Colors.orange),
            ),
            decoration: BoxDecoration(
              border: const Border(

                bottom: BorderSide(
                  color: Colors.orange,
                  width: 3,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: const Text('Following',
                style: TextStyle(fontSize: 25, color: Colors.orange)),
          ),

          // SizedBox(
          //   child: ListView.separated(
          //     separatorBuilder: (context, index) => const SizedBox(width: 8),
          //     itemCount: followersData.length,
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           Container(
          //             width: 50,
          //             height: 50,
          //             decoration: BoxDecoration(
          //               shape: BoxShape.circle,
          //               image: DecorationImage(
          //                 image: AssetImage(followersData[index].imageUrl),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(width: 8),
          //           Column(
          //             children: [
          //               Text(
          //                 followersData[index].nameFollower,
          //                 style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //               Text(
          //                 '${followersData[index].pointFollower}XP',
          //                 style: const TextStyle(
          //                   fontSize: 15,
          //                   color: Colors.grey,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           const Divider(
          //             color: AppColors.borderform,
          //             thickness: 3,
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // ),

        ],
      ),
    );
  }

  Widget logout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Image(
              image: AssetImage('assets/images/door.png'),
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'Logout',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
