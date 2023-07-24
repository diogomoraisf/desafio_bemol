// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:desafio_bemol/app/core/exceptions/repository_exceptions.dart';
import 'package:desafio_bemol/app/core/rest_client/custom_dio.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/repository/product_repository.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio dio;
  ProductRepositoryImpl({
    required this.dio,
  });
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final result = await dio.get('/products?limit=3');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryExceptions(
          message: 'Erro ao buscar produtos. Tente novamente mais tarde');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  List<ProductModel> runFilter(
      List<ProductModel> listaProdutos, String keyword) {
    List<ProductModel> result = [];
    if (keyword.isEmpty) {
      result = listaProdutos;
    } else {
      result = listaProdutos
          .where((produto) =>
              produto.title!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    return result;
  }
}
