import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final String contentStriped;
  final String date;
  final String author;
  final DataUser? user;
  final String imgUrl;
  final void Function()? onPressed;

  const CardInfo({
    super.key,
    required this.title,
    required this.contentStriped,
    required this.date,
    required this.author,
    this.onPressed,
    this.user,
    required this.imgUrl,
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
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 160.0,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         "https://i.ibb.co/dGcQ5bw/photo-1549692520-acc6669e2f0c-ixlib-rb-1-2.jpg",
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            CachedNetworkImage(
              imageUrl: 'https://huixin.id/assets/info/$imgUrl',
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
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
                );
              },
              errorWidget: (context, url, error) {
                return Container(
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
                );
              },
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
