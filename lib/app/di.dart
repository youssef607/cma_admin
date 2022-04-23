import 'package:cma_admin/data/network/dio_factory.dart';
import 'package:cma_admin/data/network/network_info.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // // app  service client
  // final dio = await instance<DioFactory>().getDio();
  // instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // // //repo
  // // // repository
  // instance.registerLazySingleton<Repository>(
  //     () => RepositoryImpl(instance(), instance()));

  // // remote data source
  // instance.registerLazySingleton<RemoteDataSource>(
  //     () => RemoteDataSourceImplementer(instance()));
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
}
