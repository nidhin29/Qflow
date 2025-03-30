import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/prescription/presciption_model.dart';
import 'package:hospital/Domain/prescription/presciption_service.dart';
import 'package:injectable/injectable.dart';

part 'prescription_state.dart';
part 'prescription_cubit.freezed.dart';

@injectable
class PrescriptionCubit extends Cubit<PrescriptionState> {
  final PresciptionService _presciptionService;
  PrescriptionCubit(this._presciptionService)
      : super(PrescriptionState.initial());
  getPrescription(int opTicketNo) async {
    emit(state.copyWith(isLoading: true));
    final result = await _presciptionService.getPresciptions(opTicketNo);
    emit(state.copyWith(
      isLoading: false,
      prescription: some(result),
    ));
  }
}
