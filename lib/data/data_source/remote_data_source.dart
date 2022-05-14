import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<SignInResponse> signIn(String userName, String password);
  Future<SignInResponse> addUser(AddUserRequest addUserRequest);
  Future<CategoryResponse> addCategory(AddCategoryRequest addCategoryRequest);
  Future<ProductResponse> addProduct(AddProductRequest addProductRequest);
  Future<SupplementResponse> AddSupplement(
      AddSupplementRequest addSupplementRequest);
  Future<List<CategoryResponse>> getCategory();
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<SignInResponse> signIn(String userName, String password) async {
    return await _appServiceClient.signIn(
        username: userName, password: password);
  }

  @override
  Future<SignInResponse> addUser(AddUserRequest addUserRequest) async {
    return await _appServiceClient.addUser(
        image: addUserRequest.image,
        name: addUserRequest.name,
        password: addUserRequest.password,
        role: addUserRequest.role,
        username: addUserRequest.username);
  }

  @override
  Future<CategoryResponse> addCategory(
      AddCategoryRequest addCategoryRequest) async {
    return await _appServiceClient.addCategory(
        color: addCategoryRequest.color,
        image: addCategoryRequest.image,
        label: addCategoryRequest.label);
  }

  @override
  Future<SupplementResponse> AddSupplement(
      AddSupplementRequest addSupplementRequest) async {
    return await _appServiceClient.addSupplement(
      color: addSupplementRequest.color,
      image: addSupplementRequest.image,
      price: addSupplementRequest.price,
      title: addSupplementRequest.title,
    );
  }

  @override
  Future<ProductResponse> addProduct(
      AddProductRequest addProductRequest) async {
    return await _appServiceClient.addProduct(
        categoryId: addProductRequest.categoryId,
        color: addProductRequest.color,
        image: addProductRequest.image,
        price: addProductRequest.price,
        title: addProductRequest.title);
  }

  @override
  Future<List<CategoryResponse>> getCategory() async {
    return await _appServiceClient.getCategory();
  }
}
