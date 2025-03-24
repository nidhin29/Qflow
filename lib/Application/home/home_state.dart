part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required Option<Either<MainFailure, BookingModel>> bookings,
    required Option<Either<MainFailure, BookingModel>> prevBookings,
  }) = _Initial;

  factory HomeState.initial() => HomeState(
        isLoading: false,
        bookings: none(),
        prevBookings: none(),
      );
}
