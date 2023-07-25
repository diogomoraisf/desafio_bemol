// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/services/globals.dart';

part 'favorites_state.g.dart';

@match
enum FavoritesStateStatus { initial, loading, loaded, error }

class FavoritesState extends Equatable {
  final FavoritesStateStatus status;
  final List<String> favoriteList;
  final List<ProductModel> listaProdutos;
  final String? errorMessage;
  const FavoritesState({
    required this.status,
    required this.favoriteList,
    required this.listaProdutos,
    this.errorMessage,
  });

  FavoritesState.initial()
      : status = FavoritesStateStatus.initial,
        errorMessage = null,
        favoriteList = prefs.getStringList('favoriteList') ?? [],
        listaProdutos = [];
  @override
  List<Object?> get props =>
      [status, favoriteList, listaProdutos, errorMessage];

  FavoritesState copyWith({
    FavoritesStateStatus? status,
    List<String>? favoriteList,
    List<ProductModel>? listaProdutos,
    String? errorMessage,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      favoriteList: favoriteList ?? this.favoriteList,
      listaProdutos: listaProdutos ?? this.listaProdutos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
