import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

import '../../widget/navigator_style.dart';

class ReportingDetailPage extends StatelessWidget {
  const ReportingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: 'Reporting Detail',
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                'Statistic',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            statistic(),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: const Text(
                'Education',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            education(context),
          ],
        ),
      ),
      bottomNavigationBar: const NavigatorBar(),
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

  Widget education(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            Image.asset(
              'assets/images/book-stack1.png',
              // width: MediaQuery.of(context).size.width * 0.3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reading',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                // Spacer(), // this will push the "80/100" text to the end
                const Text('80/100',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              ],
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Row(children: [
            Image.asset(
              'assets/images/podcast-2.png',
              // width: MediaQuery.of(context).size.width * 0.3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Speaking',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                // Spacer(), // this will push the "80/100" text to the end
                const Text(
                  '60/100',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
