import 'package:flutter/material.dart';

import '../../widget/AppBar/appbar_style.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(
          title: "Info",
          context: context,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 30, left: 30, right: 30),
              width: double.infinity,
              child: const Image(
                image: AssetImage('assets/images/information.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Catat, Kalender Pendidikan Tahun Ajaran 2021/2022 Terbaru!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      text:
                          'Mau tahu jatwal libur dan ujian di tahun ajaran kali ini? Agar tidak ada jatwal terlewat, penting banget nih untuk kamu mengetahui ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Kalender Pendidikan ',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black,
                            decorationThickness: 2,
                          ),
                        ),
                        TextSpan(
                          text:
                              'tahun ajaran 2021/2022. Walaupun kita masih berada di tengah-tengah pandemi, kegiatan belajar kamu tidak boleh sampai terganggu.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nah, bagi kamu yang ingin tahu mengenai info kegiatan dan momen-momen penting di sekolah selama satu tahun kedepan, kalender pendidikan ini harus kamu simak sebaik-baiknya. Di sini, kamu bisa melihat periode ujian, hari libur nasional, jatwal tahun ajaran baru, hingga jatwal pelaksanaan SNMPTN dan UTBK SBMPTN 2022',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Yuk, cek jatwal kalender pendidikan tahun ajaran 2021/2022 berikut ini. Jatwal dibawah ini mengacu pada Dinas Pendidikan DKI Jakarta dan dapat berbeda di tiap daerah sesuai dengan kebijakan pemerintah daerah masing-masing.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
