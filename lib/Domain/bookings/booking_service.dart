import 'package:dartz/dartz.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/bookings/booking_model.dart';

abstract class BookingService {
  Future<Either<MainFailure, BookingModel>> getBookings();
  Future<Either<MainFailure, BookingModel>> getPrevBookings();
}
