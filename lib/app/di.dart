import 'package:cma_admin/data/data_source/remote_data_source.dart';
import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/network/dio_factory.dart';
import 'package:cma_admin/data/repository/repository_imp.dart';
import 'package:cma_admin/domain/repository/repository.dart';
import 'package:cma_admin/domain/usecase/add_supps_to_product_usecase.dart';
import 'package:cma_admin/domain/usecase/categories_insights_usecase.dart';
import 'package:cma_admin/domain/usecase/category_details_usecase.dart';
import 'package:cma_admin/domain/usecase/category_usecase.dart';
import 'package:cma_admin/domain/usecase/dashboard_usecase.dart';
import 'package:cma_admin/domain/usecase/orders_usecase.dart';
import 'package:cma_admin/domain/usecase/product_details_usecase.dart';
import 'package:cma_admin/domain/usecase/product_usecase.dart';
import 'package:cma_admin/domain/usecase/products_insights_usecase.dart';
import 'package:cma_admin/domain/usecase/signIn_usecase.dart';
import 'package:cma_admin/domain/usecase/supplement_usecase.dart';
import 'package:cma_admin/domain/usecase/update_category_usecase.dart';
import 'package:cma_admin/domain/usecase/update_product_usecase.dart';
import 'package:cma_admin/domain/usecase/update_supplement_usecase.dart';
import 'package:cma_admin/domain/usecase/user_usecase.dart';
import 'package:cma_admin/domain/usecase/all_waiters_insights_usecase.dart';
import 'package:cma_admin/domain/usecase/waiter_insights_usecase.dart';
import 'package:cma_admin/presentation/add_supps_to_product/add_supps_to_product_viewmodel.dart';
import 'package:cma_admin/presentation/categories_insights/categories_insights_viewmodel.dart';
import 'package:cma_admin/presentation/category_details/category_details_viewmodel.dart';
import 'package:cma_admin/presentation/home/category/category_viewmodel.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/home/home_viewmodel.dart';
import 'package:cma_admin/presentation/home/orders/orders_viewmodel.dart';
import 'package:cma_admin/presentation/home/product/product_viewmodel.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_viewmodel.dart';
import 'package:cma_admin/presentation/home/users/users_viewmodel.dart';
import 'package:cma_admin/presentation/product_details/product_details_viewmodel.dart';
import 'package:cma_admin/domain/usecase/add_category_usecase.dart';
import 'package:cma_admin/domain/usecase/add_product_usecase.dart';
import 'package:cma_admin/domain/usecase/add_supplement_usecase.dart';
import 'package:cma_admin/domain/usecase/add_user_usecase.dart';
import 'package:cma_admin/presentation/add_category/add_category_viewmodel.dart';
import 'package:cma_admin/presentation/add_product/add_product_viewmodel.dart';
import 'package:cma_admin/presentation/add_supplement/add_supplement_viewmodel.dart';
import 'package:cma_admin/presentation/add_user/add_user_viewmodel.dart';
import 'package:cma_admin/presentation/products_insights/products_insights_viewmodel.dart';
import 'package:cma_admin/presentation/signIn/signIn_view_model.dart';
import 'package:cma_admin/presentation/update_category/update_category_view_model.dart';
import 'package:cma_admin/presentation/update_product/update_product_view_model.dart';
import 'package:cma_admin/presentation/update_supplement/update_supplement_view_model.dart';
import 'package:cma_admin/presentation/all_waiters_insights/all_waiters_insights_viewmodel.dart';
import 'package:cma_admin/presentation/waiter_insights/waiter_insights_viewmodel.dart';
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

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance.registerLazySingleton<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initOrdersModule(){
  if (!GetIt.I.isRegistered<OrdersUseCase>()) {
    instance.registerFactory<OrdersUseCase>(() => OrdersUseCase(instance()));
    instance.registerFactory<OrdersViewModel>(() => OrdersViewModel(instance()));
  }
}

initCategoryModule() {
  if (!GetIt.I.isRegistered<CategoryUseCase>()) {
    instance
        .registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));
    instance.registerFactory<CategoryViewModel>(
        () => CategoryViewModel(instance()));
  }
}

initProductsModule() {
  if (!GetIt.I.isRegistered<ProductUseCase>()) {
    instance.registerFactory<ProductUseCase>(() => ProductUseCase(instance()));
    instance
        .registerFactory<ProductViewModel>(() => ProductViewModel(instance()));
  }
}

initSupplementsModule() {
  if (!GetIt.I.isRegistered<SupplementUseCase>()) {
    instance.registerFactory<SupplementUseCase>(
        () => SupplementUseCase(instance()));
    instance.registerFactory<SupplementViewModel>(
        () => SupplementViewModel(instance()));
  }
}

initUsersModule() {
  if (!GetIt.I.isRegistered<UserUseCase>()) {
    instance.registerFactory<UserUseCase>(() => UserUseCase(instance()));
    instance.registerFactory<UserViewModel>(() => UserViewModel(instance()));
  }
}

initDashboardModule() {
  if (!GetIt.I.isRegistered<DashboardUseCase>()) {
    instance
        .registerFactory<DashboardUseCase>(() => DashboardUseCase(instance()));
    instance.registerFactory<DashboardViewModel>(
        () => DashboardViewModel(instance()));
  }
}

initCategoryDetailsModule() {
  if (!GetIt.I.isRegistered<CategoryDetailsUseCase>()) {
    instance.registerFactory<CategoryDetailsUseCase>(
        () => CategoryDetailsUseCase(instance()));
    instance.registerFactory<CategoryDetailsViewModel>(
        () => CategoryDetailsViewModel(instance()));
  }
}

initProductDetailsModule() {
  if (!GetIt.I.isRegistered<ProductDetailsUseCase>()) {
    instance.registerFactory<ProductDetailsUseCase>(
        () => ProductDetailsUseCase(instance()));
    instance.registerFactory<ProductDetailsViewModel>(
        () => ProductDetailsViewModel(instance()));
  }
}

///init add

initAddSupplementsToProductModule() {
  if (!GetIt.I.isRegistered<AddSupplementsToProductUseCase>()) {
    instance.registerFactory<AddSupplementsToProductUseCase>(
        () => AddSupplementsToProductUseCase(instance()));
    instance.registerFactory<AddSupplementsToProductViewModel>(
        () => AddSupplementsToProductViewModel(instance()));
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

initAddProductModule() {
  if (!GetIt.I.isRegistered<AddProductUseCase>()) {
    instance.registerFactory<AddProductUseCase>(
        () => AddProductUseCase(instance()));
    instance.registerFactory<AddProductViewModel>(
        () => AddProductViewModel(instance(), instance()));
  }
}

/// init update

initUpdateSupplementModule() {
  if (!GetIt.I.isRegistered<UpdateSupplementUseCase>()) {
    instance.registerFactory<UpdateSupplementUseCase>(
        () => UpdateSupplementUseCase(instance()));
    instance.registerFactory<UpdateSupplementViewModel>(
        () => UpdateSupplementViewModel(instance()));
  }
}

initUpdateCategoryModule() {
  if (!GetIt.I.isRegistered<UpdateCategoryUseCase>()) {
    instance.registerFactory<UpdateCategoryUseCase>(
        () => UpdateCategoryUseCase(instance()));
    instance.registerFactory<UpdateCategoryViewModel>(
        () => UpdateCategoryViewModel(instance()));
  }
}

initUpdateProductModule() {
  if (!GetIt.I.isRegistered<UpdateProductUseCase>()) {
    instance.registerFactory<UpdateProductUseCase>(
        () => UpdateProductUseCase(instance()));
    instance.registerFactory<UpdateProductViewModel>(
        () => UpdateProductViewModel(instance(), instance()));
  }
}

initAllWaitersInsightsModule(){
  if (!GetIt.I.isRegistered<AllWaitersInsightsUseCase>()) {
    instance.registerFactory<AllWaitersInsightsUseCase>(() => AllWaitersInsightsUseCase(instance()));
    instance.registerFactory<AllWaitersInsightsViewModel>(() => AllWaitersInsightsViewModel(instance()));
  }
}

initWaiterInsightsModule(){
  if (!GetIt.I.isRegistered<WaiterInsightsUseCase>()) {
    instance.registerFactory<WaiterInsightsUseCase>(() => WaiterInsightsUseCase(instance()));
    instance.registerFactory<WaiterInsightsViewModel>(() => WaiterInsightsViewModel(instance()));
  }
}

initCategoriesInsightsModule(){
  if (!GetIt.I.isRegistered<CategoriesInsightsUseCase>()) {
    instance.registerFactory<CategoriesInsightsUseCase>(() => CategoriesInsightsUseCase(instance()));
    instance.registerFactory<CategoriesInsightsViewModel>(() => CategoriesInsightsViewModel(instance()));
  }
}

initProductsInsightsModule(){
  if (!GetIt.I.isRegistered<ProductsInsightsUseCase>()) {
    instance.registerFactory<ProductsInsightsUseCase>(() => ProductsInsightsUseCase(instance()));
    instance.registerFactory<ProductsInsightsViewModel>(() => ProductsInsightsViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initSignInModule();
  initHomeModule();
  initOrdersModule();
  initCategoryModule();
  initProductsModule();
  initSupplementsModule();
  initUsersModule();
  initDashboardModule();
  initCategoryDetailsModule();
  initProductDetailsModule();
  initAddSupplementsToProductModule();
  initAddUserModule();
  initAddCategoryModule();
  initAddSupplementModule();
  initAddProductModule();
  initAllWaitersInsightsModule();
  initWaiterInsightsModule();
  initCategoriesInsightsModule();
  initProductsInsightsModule();
  //update
  initUpdateSupplementModule();
  initUpdateCategoryModule();
  initUpdateProductModule();
}
