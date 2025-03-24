// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hospital/Application/booking/booking_cubit.dart' as _i135;
import 'package:hospital/Application/doctor/doctor_cubit.dart' as _i604;
import 'package:hospital/Application/edit_profile/editprofile_cubit.dart'
    as _i862;
import 'package:hospital/Application/Feedback/feedback_cubit.dart' as _i569;
import 'package:hospital/Application/home/home_cubit.dart' as _i420;
import 'package:hospital/Application/loggedin/loggedin_cubit.dart' as _i904;
import 'package:hospital/Application/prescription/prescription_cubit.dart'
    as _i762;
import 'package:hospital/Application/profile/profile_cubit.dart' as _i1003;
import 'package:hospital/Application/signin/signin_cubit.dart' as _i1028;
import 'package:hospital/Application/signup/signup_cubit.dart' as _i128;
import 'package:hospital/Domain/bookings/booking_service.dart' as _i197;
import 'package:hospital/Domain/doctor/doctor_service.dart' as _i738;
import 'package:hospital/Domain/feedback/feedback_service.dart' as _i321;
import 'package:hospital/Domain/LoggedIn/logged_in_service.dart' as _i1013;
import 'package:hospital/Domain/prescription/presciption_service.dart' as _i826;
import 'package:hospital/Domain/Profile/profile_service.dart' as _i631;
import 'package:hospital/Domain/SignIn/sign_in_service.dart' as _i786;
import 'package:hospital/Domain/signout/sign_out_service.dart' as _i35;
import 'package:hospital/Domain/SignUp/sign_up_service.dart' as _i619;
import 'package:hospital/Domain/TokenManager/token_service.dart' as _i921;
import 'package:hospital/Infrastructure/booking/booking_repo.dart' as _i752;
import 'package:hospital/Infrastructure/doctor/doctor_repo.dart' as _i390;
import 'package:hospital/Infrastructure/feedback/feedback_repo.dart' as _i567;
import 'package:hospital/Infrastructure/LoggedIn/logged_in_repo.dart' as _i879;
import 'package:hospital/Infrastructure/presciption/prescription_repo.dart'
    as _i616;
import 'package:hospital/Infrastructure/Profile/profile_repo.dart' as _i42;
import 'package:hospital/Infrastructure/SignIn/sign_in_repo.dart' as _i893;
import 'package:hospital/Infrastructure/signout/signout.dart' as _i193;
import 'package:hospital/Infrastructure/SignUp/signup_repo.dart' as _i30;
import 'package:hospital/Infrastructure/TokenManager/token_repo.dart' as _i245;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i321.FeedbackService>(() => _i567.FeedbackRepo());
    gh.lazySingleton<_i786.SignInService>(() => _i893.SignInRepo());
    gh.lazySingleton<_i921.TokenService>(() => _i245.TokenRepo());
    gh.lazySingleton<_i619.SignUpService>(() => _i30.SignUpRepo());
    gh.lazySingleton<_i826.PresciptionService>(() => _i616.PrescriptionRepo());
    gh.lazySingleton<_i631.ProfileService>(() => _i42.ProfileRepo());
    gh.lazySingleton<_i197.BookingService>(() => _i752.BookingRepo());
    gh.lazySingleton<_i35.SignOutService>(() => _i193.SignoutRepo());
    gh.factory<_i569.FeedbackCubit>(
        () => _i569.FeedbackCubit(gh<_i321.FeedbackService>()));
    gh.factory<_i1028.SigninCubit>(() => _i1028.SigninCubit(
          gh<_i786.SignInService>(),
          gh<_i921.TokenService>(),
        ));
    gh.lazySingleton<_i738.DoctorService>(() => _i390.DoctorRepo());
    gh.lazySingleton<_i1013.LoggedInService>(() => _i879.LoggedInRepo());
    gh.factory<_i904.LoggedinCubit>(
        () => _i904.LoggedinCubit(gh<_i1013.LoggedInService>()));
    gh.factory<_i762.PrescriptionCubit>(
        () => _i762.PrescriptionCubit(gh<_i826.PresciptionService>()));
    gh.factory<_i420.HomeCubit>(
        () => _i420.HomeCubit(gh<_i197.BookingService>()));
    gh.factory<_i128.SignupCubit>(
        () => _i128.SignupCubit(gh<_i619.SignUpService>()));
    gh.factory<_i862.EditprofileCubit>(
        () => _i862.EditprofileCubit(gh<_i631.ProfileService>()));
    gh.factory<_i1003.ProfileCubit>(() => _i1003.ProfileCubit(
          gh<_i631.ProfileService>(),
          gh<_i921.TokenService>(),
          gh<_i35.SignOutService>(),
        ));
    gh.factory<_i135.BookingCubit>(
        () => _i135.BookingCubit(gh<_i738.DoctorService>()));
    gh.factory<_i604.DoctorCubit>(
        () => _i604.DoctorCubit(gh<_i738.DoctorService>()));
    return this;
  }
}
