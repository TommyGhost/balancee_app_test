import 'package:balancee_app/presentation/base/base.vm.dart';
import 'package:balancee_app/presentation/screen/rewards/rewards_vm.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'data/remote/user_remote.dart';
import 'data/remote/user_remote_impl.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';
import 'data/services/navigation_service.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  setupDio();

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<UserRemoteImpl>(
      () => UserRemoteImpl(getIt<Dio>()));
  getIt.registerFactory<UserRemote>(
      () => UserRemoteImpl(getIt<Dio>()));
  getIt.registerFactory<UserRepository>(
      () => UserRepositoryImpl(getIt<UserRemote>()));
  registerViewModel();
}

void setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  });
}

void registerViewModel() {
  //View Model
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  getIt.registerFactory<RewardsViewModel>(() => RewardsViewModel());
}
