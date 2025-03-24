import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/signup/signup_cubit.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Presentation/Auth/sign_in.dart';
import 'package:hospital/Presentation/Home/mainscreen.dart';
import 'package:hospital/Presentation/common/snackbar.dart';
import 'package:hospital/constants/const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
              () => null,
              (either) => either.fold(
                    (failure) {
                      if (!state.isLoading) {
                        if (failure == const MainFailure.serverFailure()) {
                          displaySnackBar(
                              context: context, text: "Server is down");
                        } else if (failure == const MainFailure.authFailure()) {
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ));
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
                height: 65.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Text('Sign Up',
                    style: TextStyle(
                        fontSize: 21.45.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Phone number',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First name',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last name',
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
                      ),
                    ),
                    kheight15,
                    TextFormField(
                      controller: dobController,
                      decoration: InputDecoration(
                        labelText: 'Date of birth',
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
                      ),
                    ),
                    kheight15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                            },
                            child: Text('Sign In',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)))
                      ],
                    ),
                    kheight20,
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<SignupCubit>(context).signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                            phoneNumber: phoneNumberController.text,
                            address: addressController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            dateOfBirth: dobController.text,
                            deviceid: 'deviceid',
                          );
                        },
                        style: ButtonStyle(
                          minimumSize:
                              WidgetStateProperty.all(Size(346.w, 54.82.h)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.84.r),
                            side: const BorderSide(
                                color: Colors.black), // Border color
                          )),
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                        ),
                        child: Text('Continue',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black))),
                  ])),
            ],
          );
        },
      ),
    );
  }
}
