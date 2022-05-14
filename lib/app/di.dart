import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/network/dio_factory.dart';
import 'package:cma_admin/data/repository/repository_imp.dart';
import 'package:cma_admin/domain/repository/repository.dart';
<<<<<<< HEAD
import 'package:cma_admin/domain/usecase/add_supps_to_product_usecase.dart';
import 'package:cma_admin/domain/usecase/category_details_usecase.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/domain/usecase/dashboard_usecase.dart';
import 'package:cma_admin/domain/usecase/product_details_usecase.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:cma_admin/domain/usecase/signIn_usecase.dart';
import 'package:cma_admin/domain/usecase/supplement_usecase.dart';
import 'package:cma_admin/presentation/add_supps_to_product/add_supps_to_product_viewmodel.dart';
import 'package:cma_admin/presentation/category_details/category_details_viewmodel.dart';
import 'package:cma_admin/presentation/home/category/category_viewmodel.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/home/product/product_viewmodel.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_viewmodel.dart';
import 'package:cma_admin/presentation/product_details/product_details_viewmodel.dart';
=======
import 'package:cma_admin/domain/usecase/addcategory_usecase.dart';
import 'package:cma_admin/domain/usecase/addproduct_usecase.dart';
import 'package:cma_admin/domain/usecase/addsupplement_usecase.dart';
import 'package:cma_admin/domain/usecase/adduser_usecase.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/domain/usecase/signIn_usecase.dart';
import 'package:cma_admin/presentation/addCategory/addcategory_view_model.dart';
import 'package:cma_admin/presentation/addProduct/addProduct_view_model.dart';
import 'package:cma_admin/presentation/addSupplement/addSupplement_view_model.dart';
import 'package:cma_admin/presentation/addUser/user_view_model.dart';
>>>>>>> origin/add-product
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

<<<<<<< HEAD
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

initCategoryDetailsModule() {
  if (!GetIt.I.isRegistered<CategoryDetailsUseCase>()) {
    instance.registerFactory<CategoryDetailsUseCase>(() => CategoryDetailsUseCase(instance()));
    instance.registerFactory<CategoryDetailsViewModel>(() => CategoryDetailsViewModel(instance()));
  }
}

initProductDetailsModule() {
  if (!GetIt.I.isRegistered<ProductDetailsUseCase>()) {
    instance.registerFactory<ProductDetailsUseCase>(() => ProductDetailsUseCase(instance()));
    instance.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel(instance()));
  }
}

initAddSupplementsToProductModule() {
  if (!GetIt.I.isRegistered<AddSupplementsToProductUseCase>()) {
    instance.registerFactory<AddSupplementsToProductUseCase>(() => AddSupplementsToProductUseCase(instance()));
    instance.registerFactory<AddSupplementsToProductViewModel>(() => AddSupplementsToProductViewModel(instance()));
  }
}
=======
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

initAddProductModule() {
  if (!GetIt.I.isRegistered<AddProductUseCase>()) {
    instance.registerFactory<AddProductUseCase>(
        () => AddProductUseCase(instance()));
    instance
        .registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));

    instance.registerFactory<AddProductViewModel>(
        () => AddProductViewModel(instance(), instance()));
  }
}

>>>>>>> origin/add-product
resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initSignInModule();
<<<<<<< HEAD
  initCategoryModule();
  initProductsModule();
  initSupplementsModule();
  initDashboardModule();
  initCategoryDetailsModule();
  initProductDetailsModule();
  initAddSupplementsToProductModule();
=======
  initAddUserModule();
  initAddCategoryModule();
  initAddSupplementModule();
  initAddProductModule();
>>>>>>> origin/add-product
}
