import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/Profile/model.dart';

abstract class ProfileService {
  Future<Either<MainFailure, Model>> getProfile();
  Future<Either<MainFailure, Unit>> updateProfile(
      {required ProfileModel profileModel});
}

class ProfileModel {
  final String username;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  final String firstName;
  final String lastName;
  final String dateOfBirth;

  ProfileModel({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
  });
}
