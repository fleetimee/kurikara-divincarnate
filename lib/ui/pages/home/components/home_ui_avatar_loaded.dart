import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:shimmer/shimmer.dart';

class AvatarLoader extends StatelessWidget {
  final int index;
  final GetActiveStudentResponseModel data;

  const AvatarLoader({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: data.data![index].imgFile == null
              ? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
              : 'https://huixin.id/assets/fileuser/${data.data![index].imgFile}',
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              radius: 30,
              backgroundImage: imageProvider,
            );
          },
          placeholder: (context, url) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: CircleAvatar(
                radius: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return const CircleAvatar(
              radius: 30,
              child: Icon(Icons.error),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          data.data![index].fullName == null
              ? '..'
              : data.data![index].fullName!.length > 10
                  ? '${data.data![index].fullName!.substring(0, 10)}...'
                  : data.data![index].fullName?.split(' ')[0] ?? '..',
          // data.data![index].fullName!.length > 10
          //     ? '${data.data![index].fullName!.substring(0, 10)}...'
          //     : data.data![index].fullName?.split(' ')[0] ?? '..',
        ),
      ],
    );
  }
}
