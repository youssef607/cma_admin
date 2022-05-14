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

  @POST("/supplement/save")
  @MultiPart()
  Future<SupplementResponse> addSupplement({
    @Part() required String color,
    @Part() PickerFile? image,
    @Part() required String price,
    @Part() required String title,
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

  @GET('/category/all')
  Future<List<CategoryResponse>> getCategory();
}




    // if (image != null) {
    //   _data.files.add(MapEntry(
    //       'image',
    //       MultipartFile.fromBytes(image.byte,
    //           filename: "image.${image.extensions}")));
    // }
