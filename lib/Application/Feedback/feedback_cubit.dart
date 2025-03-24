import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/feedback/feedback_service.dart';
import 'package:injectable/injectable.dart';

part 'feedback_state.dart';
part 'feedback_cubit.freezed.dart';

@injectable
class FeedbackCubit extends Cubit<FeedbackState> {
  final FeedbackService _feedbackService;
  FeedbackCubit(this._feedbackService) : super(FeedbackState.initial());

  submitFeedback(String feedback) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _feedbackService.submitFeedback(feedback);
    response.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )),
        (r) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(right(r)),
            )));
  }

  submitHealth(Health health) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _feedbackService.submitHealth(health);
    response.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )),
        (r) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(right(r)),
            )));
  }
}
