import 'package:desafio_bemol/app/pages/product/product_controller.dart';
import 'package:desafio_bemol/app/pages/product/product_page.dart';
import 'package:desafio_bemol/app/repository/product_repository.dart';
import 'package:desafio_bemol/app/repository/product_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductRouter {
  ProductRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => ProductController(context.read()),
          )
        ],
        builder: (context, child) {
          var args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductPage(
            idProduto: args['idProduto'],
          );
        },
      );
}
