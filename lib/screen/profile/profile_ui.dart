import 'package:flutter/material.dart';

import '../../widget/AppBar/appbar_style.dart';
import '../../widget/navigator_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Container(
      //   child: RoundedAppBar(),
      // )
      appBar: AppBarDefault(
        title: "Profile",
      ),

      body: Column(
        children: [
          profileUser(),
          information(context),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'Statistic',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          statistic(),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              'Friends',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          // friend(),
          logout(context),
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
              color: Colors.grey,
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
                  'Novian Andika',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const Text(
                  'UserX123',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Row(
                  children: const [
                    Icon(Icons.timelapse, size: 30, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
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
                'assets/images/profile.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }

  Widget information(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        height: 90,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.grey,
              width: 3,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.chat_bubble, color: Colors.grey),
              const SizedBox(width: 10),
              const Text(
                'Pengumuman untuk peserta ...',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(width: 10),
              // Icon(Icons.arrow_forward_ios, size: 30, color: Colors.grey),
              IconButton(
                // iconSize: 25,
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile/information');
                },
              ),
            ],
          ),
        ));
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
                    color: Colors.grey,
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
                    color: Colors.grey,
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

  Widget friend() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: const Text(
            'Friends',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                // alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Text(
                  'Follower',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 25, color: Colors.orange),
                ),
              ),
              ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return;
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget logout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            // iconSize: 25,
            icon: const Icon(Icons.lock_open_outlined),
            onPressed: () {
              Navigator.pushNamed(context, '/profile/information');
            },
          ),
          const Text(
            'Logout',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
