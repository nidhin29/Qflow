import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/SignUp/sign_up_service.dart';
import 'package:hospital/constants/const.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Domain/TokenManager/token_manager.dart' show TokenManager;

@LazySingleton(as: SignUpService)
class SignUpRepo implements SignUpService {
  @override
  Future<Either<MainFailure, Unit>> signUp({
    required String username,
    required String email,
    required String phoneNumber,
    required String address,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
  }) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers)).post(
        "${baseUrl}User/UserReg",
        data: {
          "email": email,
          "password": password,
          "username": username,
          "phone_number": phoneNumber,
          "address": address,
          "first_name": firstName,
          "last_name": lastName,
          "date_of_birth": dateOfBirth,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
         TokenManager.instance.setEmail(email);
            final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('email', TokenManager.instance.email!);
        log(response.data.toString());
        return const Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 409) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
