import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/network/dio_factory.dart';
import 'package:cma_admin/data/repository/repository_imp.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/addcategory_usecase.dart';
import 'package:cma_admin/domain/usecase/addsupplement_usecase.dart';
import 'package:cma_admin/domain/usecase/adduser_usecase.dart';
import 'package:cma_admin/domain/usecase/signIn_usecase.dart';
import 'package:cma_admin/presentation/addCategory/addcategory_view_model.dart';
import 'package:cma_admin/presentation/addSupplement/addSupplement_view_model.dart';
import 'package:cma_admin/presentation/addUser/user_view_model.dart';
import 'package:cma_admin/presentation/signIn/signIn_view_model.dart';
import 'package:get_it/get_it.dart';
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

  // // // network info
  // instance.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // // //repo
  // // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

  // // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));
}

initSignInModule() {
  if (!GetIt.I.isRegistered<SignInUseCase>()) {
    instance.registerFactory<SignInUseCase>(() => SignInUseCase(instance()));
    instance
        .registerFactory<SignInViewModel>(() => SignInViewModel(instance()));
  }
}

initAddUserModule() {
  if (!GetIt.I.isRegistered<AddUserUseCase>()) {
    instance.registerFactory<AddUserUseCase>(() => AddUserUseCase(instance()));
    instance
        .registerFactory<AddUserViewModel>(() => AddUserViewModel(instance()));
  }
}

initAddCategoryModule() {
  if (!GetIt.I.isRegistered<AddCategoryUseCase>()) {
    instance.registerFactory<AddCategoryUseCase>(
        () => AddCategoryUseCase(instance()));

    instance.registerFactory<AddCategoryViewModel>(
        () => AddCategoryViewModel(instance()));
  }
}

initAddSupplementModule() {
  if (!GetIt.I.isRegistered<AddSupplementUseCase>()) {
    instance.registerFactory<AddSupplementUseCase>(
        () => AddSupplementUseCase(instance()));

    instance.registerFactory<AddSupplementViewModel>(
        () => AddSupplementViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initSignInModule();
  initAddUserModule();
  initAddCategoryModule();
  initAddSupplementModule();
}
