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

  final ValueNotifier<bool> obtext = ValueNotifier<bool>(false);

  void passwordFunction() {
    obtext.value = !obtext.value;
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
                        builder: (context) =>  MainScreen(),
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
          return SingleChildScrollView(
            child: Column(
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          errorStyle: TextStyle(fontSize: 10),
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
                        builder: (context, value, child) => TextFormField(
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          obscureText: value,
                          controller: passwordController,
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 10),
                            suffixIcon: IconButton(
                              onPressed: passwordFunction,
                              icon: Icon(value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
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
                      ),
                      kheight15,
                      TextFormField(
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                usernameController.text.isEmpty ||
                                phoneNumberController.text.isEmpty ||
                                addressController.text.isEmpty ||
                                firstNameController.text.isEmpty ||
                                lastNameController.text.isEmpty ||
                                dobController.text.isEmpty) {
                              displaySnackBar(
                                  context: context,
                                  text: "Please fill all the fields");
                            } else {
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
                            }
                          },
                          style: ButtonStyle(
                            minimumSize:
                                WidgetStateProperty.all(Size(346.w, 54.82.h)),
                            shape:
                                WidgetStateProperty.all(RoundedRectangleBorder(
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
                      kheight20,
                      kheight20,
                      kheight20,
                      kheight10
                    ])),
              ],
            ),
          );
        },
      ),
    );
  }
}
