import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';

class MateriCardHeader extends StatelessWidget {
  const MateriCardHeader({
    super.key,
    required this.masterGroupMateri,
  });

  final MasterGroupMateri masterGroupMateri;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/images/container.png",
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 15,
          left: MediaQuery.of(context).size.width * 0.11,
          // child: Image.asset(
          //   "assets/images/tree.png",
          //   height: 100,
          //   fit: BoxFit.fill,
          // ),
          child: CachedNetworkImage(
            imageUrl:
                'https://huixin.id/assets/group_materi/${masterGroupMateri.imgFile}',
            imageBuilder: (context, imageProvider) => Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 30,
          right: MediaQuery.of(context).size.width * 0.17,
          child: Text(
            '${masterGroupMateri.name}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 70,
          right: MediaQuery.of(context).size.width / 30,
          child: Image.asset(
            "assets/images/progress_bar.png",
            height: 25,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
