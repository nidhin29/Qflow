import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';

abstract class SignUpService {
  Future<Either<MainFailure, Unit>> signUp({
    required String username,
    required String email,
    required String phoneNumber,
    required String address,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
  });
}
