import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:shimmer/shimmer.dart';

class CardDetail extends StatelessWidget {
  final String title;
  final String content;
  final String imgUrl;
  final DataUser? user;

  const CardDetail({
    super.key,
    required this.title,
    required this.content,
    required this.imgUrl,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 40,
                ),
                child: const Icon(Icons.error),
              );
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
