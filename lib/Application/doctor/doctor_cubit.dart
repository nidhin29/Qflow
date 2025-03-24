import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/doctor/doctor_model.dart';
import 'package:hospital/Domain/doctor/doctor_service.dart';
import 'package:injectable/injectable.dart';

part 'doctor_state.dart';
part 'doctor_cubit.freezed.dart';

@injectable
class DoctorCubit extends Cubit<DoctorState> {
  final DoctorService _doctorService;
  DoctorCubit(this._doctorService) : super(DoctorState.initial());

  getDoctor() async {
    emit(state.copyWith(isLoading: true));
    final result = await _doctorService.getDoctors();
    emit(state.copyWith(
      isLoading: false,
      doctors: some(result),
    ));
  }

  bookAppointment(Doctor doctor) async {
    emit(state.copyWith(isLoading: true));
    final result = await _doctorService.bookAppointment(doctor);
    emit(state.copyWith(
      isLoading: false,
      bookAppointment: some(result),
    ));
  }
}
