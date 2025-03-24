import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/TokenManager/token_manager.dart';
import 'package:hospital/Domain/bookings/booking_model.dart';
import 'package:hospital/Domain/bookings/booking_service.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final BookingService _bookingService;
  HomeCubit(this._bookingService) : super(HomeState.initial());

  getBookings() async {
    emit(state.copyWith(isLoading: true));
    final result = await _bookingService.getBookings();
    result.fold(
      (f) {
        emit(state.copyWith(
            isLoading: false,
            bookings: some(
              left(f),
            )));
      },
      (r) {
        print(r.name);
        TokenManager.instance.setName(r.name!);
        emit(state.copyWith(
          isLoading: false,
          bookings: some(right(r)),
        ));
      },
    );
  }

  getPrevBookings() async {
    emit(state.copyWith(isLoading: true));
    final result = await _bookingService.getPrevBookings();
    emit(state.copyWith(
      isLoading: false,
      prevBookings: some(result),
    ));
  }
}
