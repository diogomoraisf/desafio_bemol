import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_bemol/app/core/ui/base_state/base_state.dart';
import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:desafio_bemol/app/core/widgets/custom_app_bar.dart';
import 'package:desafio_bemol/app/core/widgets/info_message.dart';
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
            loading: () => print('loading'),
            loaded: () => print('loaded'),
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
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxHeight: 310),
                            width: double.infinity,
                            color: Colors.pink,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                state.productData.image!,
                                fit: BoxFit.contain,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.greenAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 5, bottom: 5),
                              child: AutoSizeText(
                                state.productData.title!,
                                style: TextStyles.instance.baseTitleProduct,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: const InfoMessage(message: 'Carregando..')));
        },
      ),
    );
  }
}
