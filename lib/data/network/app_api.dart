import 'dart:io';
import 'dart:typed_data';

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
}
