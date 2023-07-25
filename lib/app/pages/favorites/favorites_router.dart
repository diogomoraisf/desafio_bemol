import 'package:desafio_bemol/app/pages/favorites/favorites_controller.dart';
import 'package:desafio_bemol/app/pages/favorites/favorites_page.dart';
import 'package:desafio_bemol/app/pages/home/home_controller.dart';
import 'package:desafio_bemol/app/repository/product_repository.dart';
import 'package:desafio_bemol/app/repository/product_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesRouter {
  FavoritesRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => HomeController(context.read()),
          ),
          Provider(
            create: (context) => FavoritesController(),
          )
        ],
        builder: (context, child) {
          var args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return FavoritesPage(listaProdutos: args['listaProdutos']);
        },
      );
}
