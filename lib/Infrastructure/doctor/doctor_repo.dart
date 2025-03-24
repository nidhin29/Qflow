import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/doctor/doctor_model.dart';
import 'package:hospital/Domain/doctor/doctor_service.dart';
import 'package:hospital/constants/const.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: DoctorService)
class DoctorRepo implements DoctorService {
  @override
  Future<Either<MainFailure, Unit>> bookAppointment(Doctor doctor) async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .post("${baseUrl}User/book_appointment", data: {
        'email': email,
        'doctor': doctor.doctor,
        'appointment_date': doctor.date,
        'symptoms': doctor.symptoms,
        'additional_details': doctor.details,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }

  @override
  Future<Either<MainFailure, List<DoctorModel>>> getDoctors() async {
    try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers)).get(
        "${baseUrl}User/doctors",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<DoctorModel> doctorList = (response.data as List)
            .map((doctor) => DoctorModel.fromJson(doctor))
            .toList();
        return Right(doctorList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
