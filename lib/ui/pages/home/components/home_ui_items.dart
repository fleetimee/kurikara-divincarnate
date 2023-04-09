import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/active_student/active_student_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_avatar_loaded.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_avatar_loading.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_tile_master.dart';
import 'package:flutter_huixin_app/ui/pages/home/components/home_ui_tile_master_loading.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Students',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ActiveStudentCubit, ActiveStudentState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: 330,
                      height: 100,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemCount: state.maybeMap(
                          orElse: () => 6,
                          loaded: (state) => state.data.data?.length ?? 0,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return state.when(
                            initial: () {
                              return const AvatarLoading();
                            },
                            loading: () {
                              return const AvatarLoading();
                            },
                            loaded: (data) {
                              return AvatarLoader(
                                data: data,
                                index: index,
                              );
                            },
                            error: (message) {
                              return Text(message);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    showMaterialModalBottomSheet(
                      expand: true,
                      context: context,
                      builder: (context) => Scaffold(
                        appBar: AppBarDefault(
                          title: 'Active Students',
                        ),
                        body: SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<ActiveStudentCubit,
                                ActiveStudentState>(
                              builder: (context, state) {
                                return ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 1,
                                      thickness: 1,
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: state.maybeMap(
                                    orElse: () => 6,
                                    loaded: (state) =>
                                        state.data.data?.length ?? 0,
                                  ),
                                  itemBuilder: (context, index) {
                                    return state.when(
                                      initial: () {
                                        return const AvatarLoading();
                                      },
                                      loading: () {
                                        return const AvatarLoading();
                                      },
                                      loaded: (data) {
                                        return ListTile(
                                          leading: CachedNetworkImage(
                                            imageUrl: data
                                                        .data![index].imgFile ==
                                                    null
                                                ? 'https://pwco.com.sg/wp-content/uploads/2020/05/Generic-Profile-Placeholder-v3-1536x1536.png'
                                                : 'https://huixin.id/assets/fileuser/${data.data![index].imgFile}',
                                            imageBuilder: (context, image) =>
                                                Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: image,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            data.data![index].fullName ?? '..',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          subtitle: Text(
                                            '${data.data![index].jmlAktivitas!} XP',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          trailing: Text(
                                            DateFormat(
                                                    'EEEE dd MMMM yyyy', 'id')
                                                .format(
                                              DateTime.parse(
                                                data.data![index].dateLog
                                                    .toString(),
                                              ),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      },
                                      error: (message) {
                                        return Text(message);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/more_students.png",
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<MasterLevelCubit, MasterLevelState>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: state.maybeMap(
                    orElse: () => 9,
                    loaded: (state) => state.data.data?.length ?? 0,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return state.when(
                      initial: () {
                        return null;
                      },
                      loading: () {
                        return const TileMasterLevelLoading();
                      },
                      loaded: (data) {
                        return TileMasterLevel(
                          index: index,
                          masterLevel: data.data![index],
                          state: state,
                        );
                      },
                      error: (message) {
                        return Text(message);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
