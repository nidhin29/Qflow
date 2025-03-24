import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/doctor/doctor_service.dart';
import 'package:injectable/injectable.dart';

part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final DoctorService _doctorService;
  BookingCubit(this._doctorService) : super(BookingState.initial());

  bookAppointment(Doctor doctor) async {
    emit(state.copyWith(isLoading: true));
    final result = await _doctorService.bookAppointment(doctor);
    emit(state.copyWith(
      isLoading: false,
      bookAppointment: some(result),
    ));
  }
}
