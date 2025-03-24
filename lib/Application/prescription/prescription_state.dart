part of 'prescription_cubit.dart';

@freezed
abstract class PrescriptionState with _$PrescriptionState {
  const factory PrescriptionState({
    required bool isLoading,
    required Option<Either<MainFailure, List<PresciptionModel>>> prescription,
  }) = _Initial;

 factory PrescriptionState.initial() => PrescriptionState(
        isLoading: false,
        prescription: none(),
      );

}
