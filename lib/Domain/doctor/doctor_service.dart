import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/doctor/doctor_model.dart';

abstract class DoctorService {
  Future<Either<MainFailure, List<DoctorModel>>> getDoctors();

  Future<Either<MainFailure, Unit>> bookAppointment(Doctor doctor);
}

class Doctor {
  final String doctor;
  final String symptoms;
  final String details;
  final String date;

  Doctor({
    required this.doctor,
    required this.symptoms,
    required this.details,
    required this.date,
  });
}
