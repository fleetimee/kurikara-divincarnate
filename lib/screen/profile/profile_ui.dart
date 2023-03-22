import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/data/fren.dart';
import 'package:huixinapp/data/stats.dart';

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
                        Navigator.pushNamed(context, '/profile/profiledetail');
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
                      child: Text(
                        'Statistics',
                        style: ThemeText.textTheme12,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                          allStats[index].value,
                                          style: ThemeText.textTheme6,
                                        ),
                                        Text(
                                          allStats[index].title,
                                          style: ThemeText.textTheme7,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      child: Text('Friends', style: ThemeText.textTheme12),
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
                    child: logout(context),
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
                Text(
                  'Usada Pekora',
                  style: ThemeText.textTheme12
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  'peko-peko69',
                  style: ThemeText.textTheme13,
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
                    Text(
                      'Joined March 2023',
                      style: ThemeText.textTheme14,
                    ),
                  ],
                ),
              ],
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/usada-pekora.png'),
              backgroundColor: Colors.grey,
            )
          ],
        ));
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
              Text(
                'Pengumuman untuk Peserta ...',
                style: ThemeText.textTheme14,
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
                      children: [
                        Text('13', style: ThemeText.textTheme14),
                        Text('Daily Activity', style: ThemeText.textTheme15),
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
                      children: [
                        Text('4', style: ThemeText.textTheme14),
                        Text('Total XP', style: ThemeText.textTheme15),
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
            child: Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                'FOLLOWING',
                style: ThemeText.textTheme16.copyWith(
                  fontWeight: FontWeight.w600,
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
    return SizedBox(
      width: 330,
      height: 120,
      child: ListView.builder(
        itemCount: allMyFren.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            minVerticalPadding: -15,
            leading: CircleAvatar(
              backgroundImage: AssetImage(allMyFren[index].imageUrl),
            ),
            title: Text(
              allMyFren[index].name,
              style: ThemeText.textTheme14,
            ),
            subtitle: Text(
              '${allMyFren[index].xp} XP',
              style: ThemeText.textTheme17,
            ),
          );
        },
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
          Text(
            'Log Out',
            style: ThemeText.textTheme18,
          ),
        ],
      ),
    );
  }
}
