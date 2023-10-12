import '../model/product_model.dart';

abstract class IProductRepository {
  //Recebe uma lista de produtos e implementa na interface
  Future<List<ProductModel>> getProduct();
}