import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/network/dio_factory.dart';
import 'package:cma_admin/data/network/network_info.dart';
import 'package:cma_admin/data/repository/repository_imp.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/domain/usecase/dashboard_usecase.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:cma_admin/domain/usecase/signIn_usecase.dart';
import 'package:cma_admin/domain/usecase/supplement_usecase.dart';
import 'package:cma_admin/presentation/home/category/category_viewmodel.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/home/product/product_viewmodel.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_viewmodel.dart';
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

initCategoryModule() {
  if (!GetIt.I.isRegistered<CategoryUseCase>()) {
    instance.registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));
    instance.registerFactory<CategoryViewModel>(() => CategoryViewModel(instance()));
  }
}

initProductsModule() {
  if (!GetIt.I.isRegistered<ProductUseCase>()) {
    instance.registerFactory<ProductUseCase>(() => ProductUseCase(instance()));
    instance.registerFactory<ProductViewModel>(() => ProductViewModel(instance()));
  }
}

initSupplementsModule() {
  if (!GetIt.I.isRegistered<SupplementUseCase>()) {
    instance.registerFactory<SupplementUseCase>(() => SupplementUseCase(instance()));
    instance.registerFactory<SupplementViewModel>(() => SupplementViewModel(instance()));
  }
}


initDashboardModule() {
  if (!GetIt.I.isRegistered<DashboardUseCase>()) {
    instance.registerFactory<DashboardUseCase>(() => DashboardUseCase(instance()));
    instance.registerFactory<DashboardViewModel>(() => DashboardViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initSignInModule();
  initCategoryModule();
  initProductsModule();
  initSupplementsModule();
  initDashboardModule();
}
