
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rankah/config/theme/app_theme.dart';
import 'package:rankah/core/functions/bloc_service.dart';
import 'package:rankah/core/network/dio_helper.dart';
import 'package:rankah/core/services/service_locator.dart';
import 'package:rankah/core/utils/app_strings.dart';
import 'package:rankah/feature/splash/presentation/screen/splash_screen.dart';
import 'package:rankah/feature/authentication/logic/cubit/forget_password_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init(); 
  await init();           

  Bloc.observer = BlocService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ForgotPasswordCubit>()),

      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: lightMode(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
