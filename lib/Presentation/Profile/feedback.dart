import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                ),
                child: TextField(
                  maxLines: 5,
                  controller: feedbackController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your feedback here',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<FeedbackCubit>(context)
                      .submitFeedback(feedbackController.text);
                },
                child: const Text('Submit'),
              )
            ],
          ),
        );
      },
    );
  }
}
