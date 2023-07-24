// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:desafio_bemol/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> listaProdutos;
  final List<ProductModel> filterProdutos;
  final String? errorMessage;
  const HomeState({
    required this.status,
    required this.listaProdutos,
    required this.filterProdutos,
    required this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        listaProdutos = [],
        filterProdutos = [],
        errorMessage = null;
  @override
  List<Object?> get props =>
      [status, listaProdutos, filterProdutos, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? listaProdutos,
    List<ProductModel>? filterProdutos,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      listaProdutos: listaProdutos ?? this.listaProdutos,
      filterProdutos: filterProdutos ?? this.filterProdutos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
