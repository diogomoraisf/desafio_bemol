import 'dart:developer';

import 'package:desafio_bemol/app/core/exceptions/repository_exceptions.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/pages/home/home_state.dart';
import 'package:desafio_bemol/app/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeState> {
  final ProductRepository _productRepository;
  HomeController(this._productRepository) : super(HomeState.initial());

  Future<void> getProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      List<ProductModel> listaProdutos =
          await _productRepository.getAllProducts();
      emit(state.copyWith(
          status: HomeStateStatus.loaded, listaProdutos: listaProdutos));
    } on RepositoryExceptions catch (e, s) {
      log('erro buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error, errorMessage: e.message));
    }
  }
}
