part of 'booking_cubit.dart';

@freezed
abstract class BookingState with _$BookingState {
  const factory BookingState({
    required bool isLoading,
    required Option<Either<MainFailure, Unit>> bookAppointment,
  }) = _Initial;

  factory BookingState.initial() => BookingState(
        isLoading: false,
        bookAppointment: none(),
      );
}
