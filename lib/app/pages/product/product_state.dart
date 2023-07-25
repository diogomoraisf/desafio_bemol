// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/services/globals.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'product_state.g.dart';

@match
enum ProductStateStatus {
  initial,
  loading,
  loaded,
  favoriting,
  favorited,
  error
}

class ProductState extends Equatable {
  final ProductStateStatus status;
  final ProductModel productData;
  final List<String> favoriteList;
  final String? errorMessage;
  const ProductState({
    required this.status,
    required this.productData,
    required this.favoriteList,
    this.errorMessage,
  });

  ProductState.initial()
      : status = ProductStateStatus.initial,
        productData = ProductModel(),
        favoriteList = prefs.getStringList('favoriteList') ?? [],
        errorMessage = null;
  @override
  List<Object?> get props => [status, favoriteList, productData, errorMessage];

  ProductState copyWith({
    ProductStateStatus? status,
    ProductModel? productData,
    List<String>? favoriteList,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      productData: productData ?? this.productData,
      favoriteList: favoriteList ?? this.favoriteList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
