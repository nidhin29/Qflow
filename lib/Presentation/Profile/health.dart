import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/Application/Feedback/feedback_cubit.dart';
import 'package:hospital/Domain/feedback/feedback_service.dart';

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
                  TextField(
                    controller: sbpController,
                    decoration: InputDecoration(
                      labelText: 'Systolic BP',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: dbpController,
                    decoration: InputDecoration(
                      labelText: 'Diastolic BP',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: sugarFastingController,
                    decoration: InputDecoration(
                      labelText: 'Sugar (Fasting)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: sugarAfterMealController,
                    decoration: InputDecoration(
                      labelText: 'Sugar (After Meal)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: pulseController,
                    decoration: InputDecoration(
                      labelText: 'Pulse',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: notesController,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
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
                      child: const Text('Submit'),
                    ),
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
