import 'package:cma_admin/data/network/app_api.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<SignInResponse> signIn(String userName, String password);
  Future<List<CategoryResponse>> getAllCategory();
  Future<List<ProductResponse>> getAllProduct();
  Future<List<SupplementResponse>> getAllSupplement();
  Future<List<UserResponse>> getAllUser();
  Future<bool> activeToggle(String type, String id);
  Future<HomeResponse> home(String date1, String date2);
  Future<List<ProductResponse>> getProductsByCategory(String id);
  Future<List<SupplementResponse>> getSupplemensByProduct(String id);
  Future<List<SupplementResponse>> getSupplementsForAdd(String id);
  Future<ProductResponse> addSupplementsToProduct(
      String productId, String suppsId);
  Future<void> deleteSupplementsToProduct(String productId, String suppId);
  Future<SignInResponse> addUser(AddUserRequest addUserRequest);
  Future<CategoryResponse> addCategory(AddCategoryRequest addCategoryRequest);
  Future<ProductResponse> addProduct(AddProductRequest addProductRequest);
  Future<SupplementResponse> addSupplement(
      AddSupplementRequest addSupplementRequest);
  Future<SupplementResponse> updateSupplement(
      UpdateSupplementRequest updateSupplementRequest);
  Future<bool> delete(String type, String id);

  Future<CategoryResponse> updateCategory(
      UpdateCategoryRequest updateCategoryRequest);
  Future<ProductResponse> updateProduct(
      UpdateProductRequest updateProductRequest);
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
  Future<List<UserResponse>> getAllUser() {
    return _appServiceClient.getAllUser();
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
  Future<ProductResponse> addSupplementsToProduct(
      String productId, String suppsId) {
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

  @override
  Future<void> deleteSupplementsToProduct(String productId, String suppId) {
    return _appServiceClient.deleteSupplementFromProduct(productId, suppId);
  }

  @override
  Future<bool> delete(String type, String id) {
    return _appServiceClient.delete(type, id);
  }

  @override
  Future<SupplementResponse> updateSupplement(
      UpdateSupplementRequest updateSupplementRequest) async {
    return await _appServiceClient.UpdateSupplement(
      id: updateSupplementRequest.id,
      color: updateSupplementRequest.color,
      image: updateSupplementRequest.image,
      price: updateSupplementRequest.price,
      title: updateSupplementRequest.title,
    );
  }

  @override
  Future<CategoryResponse> updateCategory(
      UpdateCategoryRequest updateCategoryRequest) async {
    return await _appServiceClient.UpdateCategory(
        id: updateCategoryRequest.id,
        color: updateCategoryRequest.color,
        image: updateCategoryRequest.image,
        label: updateCategoryRequest.label);
  }

  @override
  Future<ProductResponse> updateProduct(
      UpdateProductRequest updateProductRequest) async {
    return await _appServiceClient.updateProduct(
        id: updateProductRequest.id,
        categoryId: updateProductRequest.categoryId,
        color: updateProductRequest.color,
        image: updateProductRequest.image,
        price: updateProductRequest.price,
        title: updateProductRequest.title);
  }
}
