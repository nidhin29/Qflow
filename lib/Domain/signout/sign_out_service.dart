import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';

abstract class SignOutService {
  Future<Either<MainFailure, Unit>> signOut(String deviceid);
}
