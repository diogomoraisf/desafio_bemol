import 'package:desafio_bemol/app/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(int id);
  List<ProductModel> runFilter(
      List<ProductModel> listaProdutos, String keyword);
}
