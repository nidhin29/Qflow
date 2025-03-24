import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/Failure/failure.dart';
import 'package:hospital/Domain/SignUp/sign_up_service.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignUpService _signUpService;
  // final TokenService tokenService;
  SignupCubit(
    this._signUpService,
  ) : super(SignupState.initial());

  signUp({
    required String email,
    required String password,
    required String deviceid,
    required String username,
    required String phoneNumber,
    required String address,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final Either<MainFailure, Unit> response = await _signUpService.signUp(
      email: email,
      password: password,
      username: username,
      phoneNumber: phoneNumber,
      address: address,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      //deviceid: deviceid
    );
    response.fold(
        (l) => emit(state.copyWith(
              isLoading: false,
              isFailureOrSuccess: some(left(l)),
            )), (r) async {
      emit(state.copyWith(
        isLoading: false,
        isFailureOrSuccess: some(right(r)),
      ));
    });
  }

  // saveEmail({required String email}) {
  //   TokenManager.instance.setEmail(email);
  //   tokenService.saveEmail();
  // }
}
