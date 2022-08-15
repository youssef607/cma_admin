import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/data/responses/responses.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/auth/signIn')
  @MultiPart()
  Future<SignInResponse> signIn({
    @Part() required String username,
    @Part() required String password,
  });

  @GET('/category/all')
  Future<List<CategoryResponse>> getAllCategory();

  @GET('/product/all')
  Future<List<ProductResponse>> getAllProduct();

  @GET('/supplement/all')
  Future<List<SupplementResponse>> getAllSupplement();

  @GET('/user/all')
  Future<List<UserResponse>> getAllUser();
  
  @POST('/{type}/{id}/active')
  Future<bool> activeTogle(@Path() String type, @Path() String id);

  @GET('/admin/home')
  Future<HomeResponse> home();

  @GET('/product/byCategory/{id}')
  Future<List<ProductResponse>> getProductsByCategory(@Path() String id);

  @GET('/supplement/byProduct/{id}')
  Future<List<SupplementResponse>> getSupplementsByProduct(@Path() String id);

  @GET('/supplement/supplementsToAdd/{id}')
  Future<List<SupplementResponse>> getSupplementsForAdd(@Path() String id);

  @POST('/product/{productId}/supplements/{suppsId}')
  Future<ProductResponse> addSupplementsToProduct(
      @Path() String productId, @Path() String suppsId);

  @DELETE('/product/{productId}/supplement/{suppId}')
  Future<void> deleteSupplementFromProduct(
      @Path() String productId, @Path() String suppId);

  @POST("/auth/signUp/{role}")
  @MultiPart()
  Future<SignInResponse> addUser({
    @Part() PickerFile? image,
    @Part() required String name,
    @Part() required String password,
    @Path() required String role,
    @Part() required String username,
  });

  @POST("/category/save")
  @MultiPart()
  Future<CategoryResponse> addCategory({
    @Part() PickerFile? image,
    @Part() required String label,
    @Part() required String color,
  });

  @PUT("/category/{id}/update")
  @MultiPart()
  Future<CategoryResponse> UpdateCategory({
    @Path() required String id,
    @Part() PickerFile? image,
    @Part() required String label,
    @Part() required String color,
  });

  @POST("/supplement/save")
  @MultiPart()
  Future<SupplementResponse> addSupplement({
    @Part() required String color,
    @Part() PickerFile? image,
    @Part() required String price,
    @Part() required String title,
  });

  @PUT("/supplement/{id}/update")
  @MultiPart()
  Future<SupplementResponse> UpdateSupplement({
    @Part() String? color,
    @Part() PickerFile? image,
    @Part() required String price,
    @Part() required String title,
    @Path() required String id,
  });

  @POST("/product/save")
  @MultiPart()
  Future<ProductResponse> addProduct({
    @Part() required String categoryId,
    @Part() required String color,
    @Part() PickerFile? image,
    @Part() required String price,
    @Part() required String title,
  });

  @PUT("/product/{id}/update")
  @MultiPart()
  Future<ProductResponse> updateProduct({
    @Path() required String id,
    @Part() required String categoryId,
    @Part() required String color,
    @Part() PickerFile? image,
    @Part() required String price,
    @Part() required String title,
  });

  @DELETE("/{type}/{id}/delete")
  Future<bool> delete(@Path() String type, @Path() String id);

  @GET("/order/{id}/print")
  Future<void> print(@Path() String id);
  
  @POST("/{type}/reorder/{id1}/{id2}")
  Future<void> reorder(@Path() String type,@Path() String id1,@Path() String id2);

  @GET("/admin/waiters/insights/{date1}/{date2}")
  Future<AllWaitersInsightsResponse> getAllWaitersInsights(@Path() String date1,@Path() String date2);
  
  @GET("/admin/waiter/{id}/insights/{date1}/{date2}")
  Future<WaiterInsightsResponse> getWaiterInsights(@Path() String date1,@Path() String date2,@Path() String id);

  @GET('/admin/orders/insights/{date1}/{date2}?page={pageIndex}&size=10')
  Future<OrdersInsightsResponse> getOrdersInsights(@Path() String date1,@Path() String date2,@Path() String pageIndex);
  
  @GET("/admin/categories/quantity/{date1}/{date2}")
  Future<List<CategoryCountResponse>> getCategoriesQuantityConsumed(@Path() String date1,@Path() String date2);

  @GET("/admin/category/{categoryId}/products/quantity/{date1}/{date2}")
  Future<List<ProductCountResponse>> getProductsQuantityConsumedByCategory(@Path() String date1,@Path() String date2,@Path() String categoryId);

}
