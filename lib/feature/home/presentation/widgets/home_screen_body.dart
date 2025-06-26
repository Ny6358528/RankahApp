import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rankah/core/utils/app_colors.dart';
import 'package:rankah/core/utils/app_font.dart';
import 'package:rankah/feature/home/presentation/widgets/home_screen_body_information.dart';
import 'package:rankah/feature/home/presentation/widgets/spots_items.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            activeColor: AppColors.primaryColor,
          ),
          Divider(),
          HomeScreenBodyPictures(),
          Column(
            children: [
              Text("Find Your Parking Spot Now ",
                  style: appTextStyleWithColor(
                      fontSize: AppFontSize.s20,
                      fontWeight: FontWeight.bold,
                      fontColor: AppColors.primaryColor)),
              Text(
                'Find parking, and  plan your trips with ease, and drive safely with peace of mind  with Rankah Application.',
                style: appTextStyleWithColor(
                    fontSize: AppFontSize.s10,
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.fourthColor),
                textAlign: TextAlign.center,
              ),
              Divider(),
              SpotsItems(),
            ],
          ),
          Divider(),
          SizedBox(height: 100.h)
        ],
      ),
    );
  }
}
