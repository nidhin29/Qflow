import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/feedback/feedback_service.dart';
import 'package:hospital/constants/const.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: FeedbackService)
class FeedbackRepo implements FeedbackService {
  @override
  Future<Either<MainFailure, Unit>> submitFeedback(String feedback) async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .post("${baseUrl}User/submit-feedback", data: {
        'email': email,
        'feedback': feedback,
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
  Future<Either<MainFailure, Unit>> submitHealth(Health health) async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .post("${baseUrl}User/submit-health-data", data: {
        'email': email,
        'systolic_bp': int.parse(health.sbp),
        'diastolic_bp': int.parse(health.dbp),
        'pulse': int.parse(health.pulse),
        'blood_sugar_fasting': int.parse(health.fsugar),
        'blood_sugar_post_meal': int.parse(health.psugar),
        'notes': health.notes
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
}
