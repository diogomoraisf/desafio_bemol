import 'package:desafio_bemol/app/core/ui/base_state/base_state.dart';
import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/widgets/custom_app_bar.dart';
import 'package:desafio_bemol/app/core/widgets/info_message.dart';
import 'package:desafio_bemol/app/core/widgets/product_single.dart';
import 'package:desafio_bemol/app/pages/product/product_controller.dart';
import 'package:desafio_bemol/app/pages/product/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  final int idProduto;
  const ProductPage({super.key, required this.idProduto});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends BaseState<ProductPage, ProductController> {
  @override
  void onReady() async {
    super.onReady();
    await controller.getProduct(widget.idProduto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detalhe do Produto',
        hideBackButton: false,
        destino: () {
          Navigator.pop(context, "favoriteList");
        },
        menuItem: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<ProductController, ProductState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      controller.addFavorite(
                          widget.idProduto, controller.state.favoriteList);
                    },
                    icon: Icon(
                      state.favoriteList.contains(widget.idProduto.toString())
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 24,
                      color: state.favoriteList
                              .contains(widget.idProduto.toString())
                          ? ColorsApp.instance.favoriteColor
                          : ColorsApp.instance.blackNormal,
                    ));
              },
            ),
          )
        ],
      ),
      body: BlocConsumer<ProductController, ProductState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            error: () {
              hideLoader();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('error', (route) => false);
            },
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
              child: state.status.name != 'loading' &&
                      state.status.name != 'initial'
                  ? Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: ProductSingle(productData: state.productData))
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const InfoMessage(message: 'Carregando..')));
        },
      ),
    );
  }
}
