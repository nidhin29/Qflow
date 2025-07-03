import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/Application/loggedin/loggedin_cubit.dart';
import 'package:hospital/Presentation/Auth/notification.dart';
import 'package:hospital/Presentation/Auth/start.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:hospital/Presentation/Home/mainscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _radius = 0.0;
  late Animation<double> animation;
  late AnimationController animcontroller;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    animcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation =
        CurvedAnimation(parent: animcontroller, curve: Curves.easeInOut);

    animcontroller.forward();
  }

  void _startAnimation() {
    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        _radius = 80.0;
      });
    });
  }

  @override
  void dispose() {
    animcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      NotificationHandle().requestNotificationPermission();
      await Future.delayed(const Duration(seconds: 2))
          .then((value) => BlocProvider.of<LoggedinCubit>(context).isLoggedIn());
    });
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocListener<LoggedinCubit, LoggedinState>(
       listener: (context, state) {
          if (state.value) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) =>  MainScreen(),
              
            ),(route) => false
            );
          }
          else {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StartPage()),
              (route) => false,
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: _radius),
                duration: const Duration(seconds: 2),
                builder: (context, radius, child) {
                  return ClipOval(
                    clipper: CircleClipper(radius),
                    child: Image.asset('assets/icon/icon.png'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  final double radius;

  CircleClipper(this.radius);

  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);
  }

  @override
  bool shouldReclip(CircleClipper oldClipper) {
    return oldClipper.radius != radius;
  }
}
