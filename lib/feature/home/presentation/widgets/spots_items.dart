import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rankah/core/functions/navigation.dart';
import 'package:rankah/feature/reservation/presentation/screen/reservation_splash_screen.dart';
import 'package:rankah/core/utils/app_colors.dart';

class SpotsItems extends StatelessWidget {
  const SpotsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.h,
      ),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        height: 125.h,
        width: MediaQuery.of(context).size.width / 2,
        child: InkWell(
          onTap: () => pushTo(context, ReservationSplashScreen(parkingSpotId: index + 1)),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: GridTile(
              header: GridTileBar(
                backgroundColor: AppColors.primaryColor.withOpacity(.50),
                title: Text(
                  "Available Spots \${index + 1} ",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ClashDisplay',
                  ),
                ),
              ),
              child: Image.asset(
                'assets/image/pngwing.com.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}