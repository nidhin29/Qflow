import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/Feedback/feedback_cubit.dart';
import 'package:hospital/Application/booking/booking_cubit.dart';
import 'package:hospital/Application/doctor/doctor_cubit.dart';
import 'package:hospital/Application/edit_profile/editprofile_cubit.dart';
import 'package:hospital/Application/home/home_cubit.dart';
import 'package:hospital/Application/loggedin/loggedin_cubit.dart';
import 'package:hospital/Application/prescription/prescription_cubit.dart';
import 'package:hospital/Application/profile/profile_cubit.dart';

import 'package:hospital/Application/signin/signin_cubit.dart';
import 'package:hospital/Application/signup/signup_cubit.dart';
import 'package:hospital/Presentation/Splash/splash.dart';
import 'package:hospital/core/injectable/injectable.dart';
import 'package:hospital/firebase_options.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print(message.notification!.title.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
          BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
          BlocProvider<LoggedinCubit>(
            create: (context) => getIt<LoggedinCubit>(),
          ),
          BlocProvider<ProfileCubit>(
            create: (context) => getIt<ProfileCubit>(),
          ),
          BlocProvider<EditprofileCubit>(
            create: (context) => getIt<EditprofileCubit>(),
          ),
          BlocProvider<DoctorCubit>(
            create: (context) => getIt<DoctorCubit>(),
          ),
          BlocProvider<BookingCubit>(
            create: (context) => getIt<BookingCubit>(),
          ),
          BlocProvider<HomeCubit>(
            create: (context) => getIt<HomeCubit>(),
          ),
          BlocProvider<FeedbackCubit>(
            create: (context) => getIt<FeedbackCubit>(),
          ),
          BlocProvider<PrescriptionCubit>(
            create: (context) => getIt<PrescriptionCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Q Flow',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          theme: ThemeData(
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: Colors.blue),
            fontFamily: 'MonumentExtended',
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.grey,
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.grey.shade100),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.grey.shade100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
