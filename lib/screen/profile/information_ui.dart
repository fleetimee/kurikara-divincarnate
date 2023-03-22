import 'package:flutter/material.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReading(
        title: 'Info',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 30, left: 30, right: 30),
              child: const Image(
                image: AssetImage('assets/images/information.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Catat, Kalender Pendidikan Tahun Ajaran 2021/2022 Terbaru!',
                    style: ThemeText.textTheme19,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ItalicizedWordText(
                    wordToItalicize: 'Kalender Pendidikan',
                    italicStyle: ThemeText.textTheme20,
                    fullText:
                        'Mau tahu jadwal libur dan ujian di tahun ajaran kali ini? Agar tidak ada jadwal terlewat, penting banget nih untuk kamu mengetahui Kalender Pendidikan tahun ajaran 2021/2022. Walaupun kita masih berada di tengah-tengah pandemi, kegiatan belajar kamu tidak boleh sampai terganggu.\n\n'
                        'Nah, bagi kamu yang ingin tahu mengenai info kegiatan dan momen-momen penting di sekolah selama satu tahun ke depan, kalender pendidikan ini harus kamu simak sebaik-baiknya. Di sini, kamu bisa melihat periode ujian, hari libur nasional, jadwal tahun ajaran baru, hingga jadwal pelaksanaan SNMPTN dan UTBK SBMPTN 2022.\n\n'
                        'Yuk, cek jadwal kalender pendidikan tahun ajaran 2021/2022 berikut ini. ',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItalicizedWordText extends StatelessWidget {
  final String wordToItalicize;
  final String fullText;
  final TextStyle? textStyle;
  final TextStyle? italicStyle;

  const ItalicizedWordText({
    Key? key,
    required this.wordToItalicize,
    required this.fullText,
    this.textStyle,
    this.italicStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ??
        const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            height: 1.5);
    final italicStyle = this.italicStyle ??
        const TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        );

    final indexOfWord = fullText.indexOf(wordToItalicize);
    final wordEndIndex = indexOfWord + wordToItalicize.length;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: fullText.substring(0, indexOfWord), style: textStyle),
          TextSpan(text: wordToItalicize, style: italicStyle),
          TextSpan(text: fullText.substring(wordEndIndex), style: textStyle),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
