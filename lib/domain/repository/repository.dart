import 'package:cma_admin/data/network/failure.dart';
import 'package:cma_admin/data/request/request.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, SignInData>> signIn(String userName, String password);
  Future<Either<Failure, List<Category>>> getAllCategory();
  Future<Either<Failure, List<Product>>> getAllProduct();
  Future<Either<Failure, List<Supplement>>> getAllSupplement();
  Future<Either<Failure, List<User>>> getAllUser();
  Future<Either<Failure, bool>> activeToggle(String type, String id);
  Future<Either<Failure, HomeData>> home();
  Future<Either<Failure, List<Product>>> getProductsByCategory(String id);
  Future<Either<Failure, List<Supplement>>> getSupplementsByProduct(String id);
  Future<Either<Failure, List<Supplement>>> getSupplementsForAdd(String id);
  Future<Either<Failure, Product>> addSupplementsToProduct(String productId, String suppsId);
  Future<Either<Failure, void>> deleteSupplementFromProduct(String productId, String suppId);
  Future<Either<Failure, SignInData>> addUser(AddUserRequest addUserRequest);
  Future<Either<Failure, Category>> addCategory(AddCategoryRequest addCategoryRequest);
  Future<Either<Failure, Supplement>> addSupplement(AddSupplementRequest addSupplementRequest);
  Future<Either<Failure, Supplement>> updateSupplement(UpdateSupplementRequest updateSupplementRequest);
  Future<Either<Failure, Product>> addProduct(AddProductRequest addProductRequest);
  Future<Either<Failure, bool>> delete(String type, String id);
  Future<Either<Failure, Category>> UpdateCategory(UpdateCategoryRequest updateCategoryRequest);
  Future<Either<Failure, Product>> updateProduct(UpdateProductRequest updateProductRequest);
  Future<Either<Failure,void>> print(String id);
  Future<Either<Failure,void>> reorder(String type,String id1,String id2);
  Future<Either<Failure,AllWaitersInsights>> getAllWaitersInsights(String date1,String date2);
  Future<Either<Failure,WaiterInsights>> getWaiterInsights(String date1,String date2,String id);
  Future<Either<Failure,OrdersInsights>> getOrdersInsights(String date1,String date2,String pageIndex);
  Future<Either<Failure,List<CategoryCount>>> getCategoriesQuantityConsumed(String date1,String date2);
  Future<Either<Failure,List<ProductCount>>> getProductsQuantityConsumedByCategory(String date1,String date2,String categoryId);

}
