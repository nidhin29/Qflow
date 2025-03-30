import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/Feedback/feedback_cubit.dart';
import 'package:hospital/Domain/feedback/feedback_service.dart';
import 'package:hospital/Presentation/common/snackbar.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController sbpController = TextEditingController();
    TextEditingController dbpController = TextEditingController();
    TextEditingController sugarFastingController = TextEditingController();
    TextEditingController sugarAfterMealController = TextEditingController();
    TextEditingController notesController = TextEditingController();
    TextEditingController pulseController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Health'),
      ),
      body: BlocConsumer<FeedbackCubit, FeedbackState>(
        listener: (context, state) {
          state.isFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
              (failure) {},
              (r) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Health submitted successfully'),
                  ),
                );
              },
            ),
          );
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    controller: sbpController,
                    decoration: InputDecoration(
                      labelText: 'Systolic BP',
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
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    controller: dbpController,
                    decoration: InputDecoration(
                      labelText: 'Diastolic BP',
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
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    controller: sugarFastingController,
                    decoration: InputDecoration(
                      labelText: 'Sugar (Fasting)',
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
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    controller: sugarAfterMealController,
                    decoration: InputDecoration(
                      labelText: 'Sugar (After Meal)',
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
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    controller: sbpController,
                    decoration: InputDecoration(
                      labelText: 'Pulse',
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
                  SizedBox(height: 16),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      hintText: 'Notes',
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
                    maxLines: 4,
                  ),
                  SizedBox(height: 28),
                  Center(
                    child:   TextButton(
                  onPressed: () {
                    if (sbpController.text.isEmpty ||
                        dbpController.text.isEmpty ||
                        sugarFastingController.text.isEmpty ||
                        sugarAfterMealController.text.isEmpty ||
                        pulseController.text.isEmpty) {
                     displaySnackBar(context: context, text: 'Please fill all the fields');
                      return;
                    }
                  BlocProvider.of<FeedbackCubit>(context)
                            .submitHealth(Health(
                          notesController.text,
                          sbp: sbpController.text,
                          dbp: dbpController.text,
                          pulse: pulseController.text,
                          fsugar: sugarFastingController.text,
                          psugar: sugarAfterMealController.text,
                        ));
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(Size(346.w, 54.82.h)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.84.r),
                      side: const BorderSide(color: Colors.black),
                    )),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  child: Text('Submit',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black))),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
