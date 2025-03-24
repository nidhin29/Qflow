import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/prescription/presciption_model.dart';
import 'package:hospital/Domain/prescription/presciption_service.dart';
import 'package:hospital/constants/const.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PresciptionService)
class PrescriptionRepo implements PresciptionService {
  @override
  Future<Either<MainFailure, List<PresciptionModel>>> getPresciptions(
      int opTicketNo) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers)).get(
        "${baseUrl}User/view_prescription",
        data: {
          'opticket_number': opTicketNo,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final List<PresciptionModel> prescription = (response.data as List)
            .map((doctor) => PresciptionModel.fromJson(doctor))
            .toList();
        return Right(prescription);
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
