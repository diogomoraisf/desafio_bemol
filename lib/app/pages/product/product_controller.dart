// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:desafio_bemol/app/core/exceptions/repository_exceptions.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/services/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_bemol/app/pages/product/product_state.dart';
import 'package:desafio_bemol/app/repository/product_repository.dart';

class ProductController extends Cubit<ProductState> {
  final ProductRepository _productRepository;
  ProductController(this._productRepository) : super(ProductState.initial());

  Future<void> getProduct(int idProduto) async {
    emit(state.copyWith(status: ProductStateStatus.loading));
    try {
      ProductModel productData = await _productRepository.getProduct(idProduto);
      emit(state.copyWith(
          status: ProductStateStatus.loaded, productData: productData));
    } on RepositoryExceptions catch (e, s) {
      log('erro ao buscar single produto', error: e, stackTrace: s);
      emit(state.copyWith(
          status: ProductStateStatus.error, errorMessage: e.message));
    }
  }

  Future<void> addFavorite(int id, List<String> favoriteList) async {
    emit(state.copyWith(status: ProductStateStatus.favoriting));
    if (favoriteList.contains(id.toString())) {
      favoriteList.remove(id.toString());
      await prefs.setStringList('favoriteList', favoriteList);
    } else {
      favoriteList.add(id.toString());
      await prefs.setStringList('favoriteList', favoriteList);
    }
    emit(state.copyWith(
        status: ProductStateStatus.favorited, favoriteList: favoriteList));
  }
}
