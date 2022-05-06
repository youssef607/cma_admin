import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/data/responses/responses.dart';
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

  @POST('/{type}/{id}/active')
  Future<bool> activeTogle(@Path() String type,@Path() String id);

  @GET('/admin/home/{date1}/{date2}')
  Future<HomeResponse> home(@Path() String date1,@Path() String date2);
}
