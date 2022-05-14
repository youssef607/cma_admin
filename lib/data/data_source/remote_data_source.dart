import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<SignInResponse> signIn(String userName, String password);
  Future<List<CategoryResponse>> getAllCategory();
  Future<List<ProductResponse>> getAllProduct();
  Future<List<SupplementResponse>> getAllSupplement();
  Future<bool> activeToggle(String type,String id);
  Future<HomeResponse> home(String date1,String date2);
  Future<List<ProductResponse>> getProductsByCategory(String id);
  Future<List<SupplementResponse>> getSupplemensByProduct(String id);
  Future<List<SupplementResponse>> getSupplementsForAdd(String id);
  Future<ProductResponse> addSupplementsToProduct(String productId,String suppsId);
  Future<SignInResponse> addUser(AddUserRequest addUserRequest);
  Future<CategoryResponse> addCategory(AddCategoryRequest addCategoryRequest);
  Future<ProductResponse> addProduct(AddProductRequest addProductRequest);
  Future<SupplementResponse> addSupplement(AddSupplementRequest addSupplementRequest);
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
  Future<List<CategoryResponse>> getAllCategory() {
    return _appServiceClient.getAllCategory();
  }

  @override
  Future<List<ProductResponse>> getAllProduct() {
    return _appServiceClient.getAllProduct();
  }

  @override
  Future<List<SupplementResponse>> getAllSupplement() {
    return _appServiceClient.getAllSupplement();
  }

  @override
  Future<bool> activeToggle(String type, String id) {
    return _appServiceClient.activeTogle(type, id);
  }

  @override
  Future<HomeResponse> home(String date1, String date2) {
    return _appServiceClient.home(date1, date2);
  }

  @override
  Future<List<ProductResponse>> getProductsByCategory(String id) {
    return _appServiceClient.getProductsByCategory(id);
  }

  @override
  Future<List<SupplementResponse>> getSupplemensByProduct(String id) {
    return _appServiceClient.getSupplementsByProduct(id);
  }

  @override
  Future<ProductResponse> addSupplementsToProduct(String productId, String suppsId) {
    return _appServiceClient.addSupplementsToProduct(productId, suppsId);
  }

  @override
  Future<List<SupplementResponse>> getSupplementsForAdd(String id) {
    return _appServiceClient.getSupplementsForAdd(id);
  }

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
  Future<SupplementResponse> addSupplement(
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

}
