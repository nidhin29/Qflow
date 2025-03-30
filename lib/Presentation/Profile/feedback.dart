import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital/Application/Feedback/feedback_cubit.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController feedbackController = TextEditingController();
    return BlocConsumer<FeedbackCubit, FeedbackState>(
      listener: (context, state) {
        state.isFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {},
            (r) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Feedback submitted successfully'),
                ),
              );
            },
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Feedback'),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 7,
                  controller: feedbackController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Write your feedback here',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    if (feedbackController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your feedback'),
                        ),
                      );
                      return;
                    }
                    BlocProvider.of<FeedbackCubit>(context, listen: false)
                        .submitFeedback(feedbackController.text);
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
            ],
          ),
        );
      },
    );
  }
}
