import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital/Domain/LoggedIn/logged_in_service.dart';
import 'package:injectable/injectable.dart';

part 'loggedin_state.dart';
part 'loggedin_cubit.freezed.dart';

@injectable
class LoggedinCubit extends Cubit<LoggedinState> {
  final LoggedInService loggedInService;
  LoggedinCubit(this.loggedInService) : super(LoggedinState.initial());

  isLoggedIn() async {
    final response = await loggedInService.isLoggedIn();
    emit(state.copyWith(value: response));
  }
}
