import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/prescription/presciption_model.dart';

abstract class PresciptionService {
  Future<Either<MainFailure, List<PresciptionModel>>> getPresciptions(int opTicketNo);
}