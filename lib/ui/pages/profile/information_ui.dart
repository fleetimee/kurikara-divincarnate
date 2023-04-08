import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:random_avatar/random_avatar.dart';

import 'package:flutter_huixin_app/cubit/home/info/info_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

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
                            onPressed: () {
                              showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Scaffold(
                                    appBar: AppBarReading(
                                        title: state.data.data?[index].title
                                                ?.substring(0, 5) ??
                                            '',
                                        context: context),
                                    body: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardDetail(
                                          title:
                                              state.data.data?[index].title ??
                                                  '',
                                          content:
                                              state.data.data?[index].content ??
                                                  '',
                                          user: user,
                                          imgUrl:
                                              state.data.data?[index].imgFile ??
                                                  '',
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  final String title;
  final String content;
  final String imgUrl;
  final DataUser? user;

  const CardDetail(
      {super.key,
      required this.title,
      required this.content,
      required this.imgUrl,
      this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   padding:
          //       const EdgeInsets.only(top: 40, bottom: 30, left: 30, right: 30),
          //   child: const Image(
          //     image: NetworkImage(
          //       'https://i.ibb.co/dGcQ5bw/photo-1549692520-acc6669e2f0c-ixlib-rb-1-2.jpg',
          //     ),
          //   ),
          // ),
          CachedNetworkImage(
            imageUrl: user?.imgFile == null || user?.imgFile == ''
                ? 'https://https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
                : 'https://huixin.id/assets/info/$imgUrl',
            imageBuilder: (context, imageProvider) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                child: Image(image: imageProvider),
              );
            },
            placeholder: (context, url) {
              return const CircularProgressIndicator();
            },
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            textAlign: TextAlign.justify,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                height: 1.5),
          ),
        ],
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
      elevation: 5,
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
