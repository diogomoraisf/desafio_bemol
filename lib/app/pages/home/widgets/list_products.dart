import 'package:desafio_bemol/app/core/widgets/product_item.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  final List<ProductModel> listaProdutos;
  final List<String> favoriteList;
  const ListProducts(
      {super.key, required this.listaProdutos, required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: listaProdutos.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          product: listaProdutos[index],
          isHomePage: true,
        );
      },
    );
  }
}
