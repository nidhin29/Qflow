import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital/Application/booking/booking_cubit.dart';
import 'package:hospital/Domain/doctor/doctor_service.dart';
import 'package:hospital/Presentation/Member/success.dart';
import 'package:hospital/Presentation/common/snackbar.dart';

class PaymentScreen extends StatelessWidget {
  final Doctor doctor;
  PaymentScreen({super.key, required this.doctor});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController noController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F6),
      body: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          state.bookAppointment.fold(
                () {},
                (either) => either.fold(
                  (failure) {},
                  (r) {
                    if (!state.isLoading) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(),
                        ),
                      );
                    } else {
                      displaySnackBar(
                          context: context,
                          text: 'Booking failed, please try again!');
                    }
                  },
                ),
              );
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                width: 340.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.r,
                      spreadRadius: 2.r,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Details:",
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                          colors: [Colors.purple, Colors.pinkAccent],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CARD NUMBER",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "XXXX  XXXX  XXXX  XXXX",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CARDHOLDER'S NAME",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "VALID THRU",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(height: 23.h),
                                    Text(
                                      "00/00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Fill in your card details:",
                      style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name & Surname',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                    SizedBox(height: 10.h),
                    TextField(
                      controller: noController,
                      decoration: InputDecoration(
                        hintText: 'Card Number',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                    SizedBox(height: 10.h),
                    TextField(
                      controller: expController,
                      decoration: InputDecoration(
                        hintText: 'Expiry Date',
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
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
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            if (nameController.text.isEmpty ||
                                noController.text.isEmpty ||
                                expController.text.isEmpty) {
                              displaySnackBar(
                                  context: context,
                                  text: 'Please fill all fields!');
                            } else {
                              BlocProvider.of<BookingCubit>(context)
                                  .bookAppointment(Doctor(
                                doctor: doctor.doctor,
                                symptoms: doctor.symptoms,
                                details: doctor.details,
                                date: doctor.date,
                              ));
                            }
                          },
                          style: ButtonStyle(
                            minimumSize: WidgetStateProperty.all(
                                Size(346.w, 54.82.h)),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.84.r),
                              side: const BorderSide(color: Colors.black),
                            )),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                          ),
                          child: Text('Submit',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black))),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
