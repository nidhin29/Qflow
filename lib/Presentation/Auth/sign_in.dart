import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/loggedin/loggedin_cubit.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Presentation/Auth/notification.dart';
import 'package:hospital/Presentation/Auth/sign_up.dart';
import 'package:hospital/Presentation/Home/mainscreen.dart';
import 'package:hospital/Presentation/common/snackbar.dart';
import 'package:hospital/constants/const.dart';
import 'package:hospital/Application/signin/signin_cubit.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> obtext = ValueNotifier<bool>(false);

  void passwordFunction() {
    obtext.value = !obtext.value;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationHandle().requestNotificationPermission();
      BlocProvider.of<LoggedinCubit>(context).isLoggedIn();
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocListener<LoggedinCubit, LoggedinState>(
        listener: (context, state) {
          if (state.value) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) =>  MainScreen(),
              
            ),(route) => false
            );
          }
        },
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            state.isFailureOrSuccess.fold(
                () => null,
                (either) => either.fold(
                      (failure) {
                        if (!state.isLoading) {
                          if (failure == const MainFailure.serverFailure()) {
                            displaySnackBar(
                                context: context, text: "Server is down");
                          } else if (failure ==
                              const MainFailure.authFailure()) {
                            displaySnackBar(
                                context: context,
                                text: "Please check the email address");
                          } else if (failure ==
                              const MainFailure.incorrectCredential()) {
                            displaySnackBar(
                                context: context, text: "Incorrect Password");
                          } else if (failure ==
                              const MainFailure.clientFailure()) {
                            displaySnackBar(
                                context: context,
                                text: "Something wrong with your network");
                          } else {
                            displaySnackBar(
                                context: context,
                                text: "Something Unexpected Happened");
                          }
                        }
                      },
                      (r) {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (context) =>  MainScreen(),
                        ),(route)=> false
                        );
                      },
                    ));
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: 87.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: Text('Log In',
                      style: TextStyle(
                          fontSize: 21.45.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 124.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 32.w, right: 32.w),
                    child: Column(children: [
                      TextFormField(
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 10),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(9.84.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(9.84.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(9.84.r),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(9.84.r),
                          ),
                        ),
                      ),
                      kheight15,
                      ValueListenableBuilder(
                        valueListenable: obtext,
                        builder: (context, value, child) {
                          return TextFormField(
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                            controller: passwordController,
                            obscureText: !value,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 3) {
                                return 'Password must be at least 8 characters';
                              } else if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'Password must contain a number';
                              }
                              //  else if (!value
                              //     .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              //   return 'Password must contain a special character';
                              // }
                              return null;
                            },
                            decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 10),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(9.84.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(9.84.r),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(9.84.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(9.84.r),
                              ),
                              suffixIcon: IconButton(
                                onPressed: passwordFunction,
                                icon: Icon(value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          );
                        },
                      ),
                      kheight15,
                      kheight20,
                      TextButton(
                          onPressed: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              displaySnackBar(
                                  context: context,
                                  text: "Please fill all the fields");
                            } else {
                              NotificationHandle()
                                  .getDeviceToken()
                                  .then((value) {
                                log(value);
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<SigninCubit>(context).signIn(
                                    emailController.text,
                                    passwordController.text,
                                    value);
                              });
                            }
                          },
                          style: ButtonStyle(
                            minimumSize:
                                WidgetStateProperty.all(Size(346.w, 54.82.h)),
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.84.r),
                              side: const BorderSide(color: Colors.black),
                            )),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                          ),
                          child: Text('Continue',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                      kheight20,
                      kheight10,
                      kheight20,
                      kheight10,
                      kheight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                              },
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)))
                        ],
                      )
                    ])),
              ],
            );
          },
        ),
      ),
    );
  }
}
