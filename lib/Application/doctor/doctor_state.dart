part of 'doctor_cubit.dart';

@freezed
abstract class DoctorState with _$DoctorState {
  const factory DoctorState({
    required bool isLoading,
    required Option<Either<MainFailure, List<DoctorModel>>> doctors,
    required Option<Either<MainFailure, Unit>> bookAppointment,
  }) = _Initial;

  factory DoctorState.initial() => DoctorState(
        isLoading: false,
        doctors: none(),
        bookAppointment: none(),
      );
}
