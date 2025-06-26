import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rankah/core/utils/app.assets.dart';
import 'package:rankah/core/utils/app_colors.dart';
import 'package:rankah/core/utils/app_font.dart';
import 'package:rankah/feature/reservation/logic/cubit/reservation_cubit.dart';
import 'package:rankah/feature/reservation/logic/cubit/reservation_state.dart';
import 'car_plate_number.dart';
import 'reservation_button.dart';

class ReservationScreenBody extends StatelessWidget {
  final int parkingSpotId;
  const ReservationScreenBody({super.key, required this.parkingSpotId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(' Reservation successful')),
          );
        } else if (state is ReservationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              Image.asset(AppAssets.reservationImage),
              Text(
                'Enter the car plate number to reserve a spot',
                style: appTextStyleWithColor(
                  fontSize: AppFontSize.s14,
                  fontColor: AppColors.fourthColor,
                ),
                textAlign: TextAlign.center,
              ),
              const CarPlateNumber(),
              if (state is ReservationLoading)
                const CircularProgressIndicator()
              else
                ReservationButton(parkingSpotId: parkingSpotId),
            ],
          ),
        );
      },
    );
  }
}
