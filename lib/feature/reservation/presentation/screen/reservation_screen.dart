import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rankah/core/utils/app_padding.dart';
import 'package:rankah/feature/reservation/logic/cubit/reservation_cubit.dart';
import 'package:rankah/feature/reservation/presentation/widgets/pending_screen_body.dart';
import 'package:rankah/feature/reservation/presentation/widgets/reservation_screen_body.dart';

class ReservationScreen extends StatefulWidget {
  final int parkingSpotId;
  const ReservationScreen({super.key, required this.parkingSpotId});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 25.h,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Reservation'),
                Tab(text: 'Pending'),
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: TabBarView(
                children: [
                  ReservationScreenBody(parkingSpotId: widget.parkingSpotId),
                  const PendingScreenBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}