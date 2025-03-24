import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/SignIn/sign_in_model.dart';

abstract class SignInService {
  Future<Either<MainFailure, SignInModel>> signInWithEmailAndPassword(
      String email, String password, String deviceid);
}
