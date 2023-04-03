import 'package:flutter/material.dart';

import '../../common/constants/color.dart';


class BottomAppBarWithNotes extends StatelessWidget {
  const BottomAppBarWithNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.whiteColor6,
      child: SizedBox(
          height: 125,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 45,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NOTE :',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orangeColor,
                  ),
                ),
                const SizedBox(height: 8),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(0.05),
                    1: FlexColumnWidth(0.83),
                    2: FlexColumnWidth(0.12),
                  },
                  children: const [
                    TableRow(
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          'This lesson must finish in one day. If you miss this leasone you must finish previous lesson to learn & finish this lesson ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          'The exercise point below 70 must repeat',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
