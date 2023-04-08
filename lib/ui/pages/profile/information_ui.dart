import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/ui/pages/profile/components/information_ui_card_detail.dart';
import 'package:flutter_huixin_app/ui/pages/profile/components/information_ui_card_info.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter_huixin_app/cubit/home/info/info_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

import '../../widgets/appbar/appbar_style.dart';

class InformationPage extends StatefulWidget {
  static const String routeName = '/information';
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

  void detailPost(state, int index) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBarReading(
              title: state.data.data?[index].title?.substring(0, 5) ?? '',
              context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardDetail(
                title: state.data.data?[index].title ?? '',
                content: state.data.data?[index].content ?? '',
                user: user,
                imgUrl: state.data.data?[index].imgFile ?? '',
              ),
            ],
          ),
        );
      },
    );
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
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
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
                              detailPost(state, index);
                            },
                            imgUrl: state.data.data?[index].imgFile ?? '',
                            user: user,
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
