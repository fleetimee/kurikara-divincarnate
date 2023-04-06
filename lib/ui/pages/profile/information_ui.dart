import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/info/info_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../widgets/appbar/appbar_style.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  DataUser? user;

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<InfoCubit>().getInfo(user?.userId ?? '');
    });
  }

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
              height: 600,
              child: BlocBuilder<InfoCubit, InfoState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (state) {
                      return ListView.builder(
                        itemCount: state.data.data?.length,
                        itemBuilder: (context, index) {
                          return CardInfo(
                            title: state.data.data?[index].title ?? '',
                            contentStriped:
                                state.data.data?[index].content ?? '',
                            date: state.data.data?[index].createdBy ?? '',
                            author: state.data.data?[index].createdBy ?? '',
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
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
                children: const [
                  Text(
                    'Catat, Kalender Pendidikan Tahun Ajaran 2021/2022 Terbaru!',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ItalicizedWordText(
                    wordToItalicize: 'Kalender Pendidikan',
                    italicStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
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

class CardInfo extends StatelessWidget {
  final String title;
  final String contentStriped;
  final String date;
  final String author;
  final void Function()? onPressed;

  const CardInfo({
    super.key,
    required this.title,
    required this.contentStriped,
    required this.date,
    required this.author,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.ibb.co/dGcQ5bw/photo-1549692520-acc6669e2f0c-ixlib-rb-1-2.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '${contentStriped.substring(0, 140)}...',
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 17.0,
                        backgroundColor: Colors.grey[200],
                        child: RandomAvatar(author),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Text(
                          author,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: onPressed,
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
