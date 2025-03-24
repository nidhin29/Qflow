import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';

abstract class FeedbackService {
  Future<Either<MainFailure, Unit>> submitFeedback(String feedback);
  Future<Either<MainFailure, Unit>> submitHealth(Health health);
}

class Health {
  final String sbp;
  final String dbp;
  final String pulse;
  final String fsugar;
  final String psugar;
  final String notes;
  Health(
    this.notes, {
    required this.sbp,
    required this.dbp,
    required this.pulse,
    required this.fsugar,
    required this.psugar,
  });
}
