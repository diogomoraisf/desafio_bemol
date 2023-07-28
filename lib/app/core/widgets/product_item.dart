import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/pages/home/home_controller.dart';
import 'package:desafio_bemol/app/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  final bool isHomePage;
  const ProductItem(
      {super.key, required this.product, required this.isHomePage});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = context.read<HomeController>();

    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, 'product',
            arguments: {'idProduto': widget.product.id}).then((value) async {});
        await controller.updateFavorite();
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 140),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                constraints: const BoxConstraints(maxHeight: 130),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Hero(
                    tag: widget.product.id!,
                    child: Image.network(
                      widget.product.image!,
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: AutoSizeText(
                        '${widget.product.title}',
                        maxLines: 2,
                        style: TextStyles.instance.baseDescription,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.star,
                              color: ColorsApp.instance.ratingColor,
                              size: 19,
                            ),
                          ),
                          AutoSizeText(
                            '${widget.product.rating!.rate} ',
                            style: TextStyles.instance.baseRating,
                          ),
                          AutoSizeText(
                            '(${widget.product.rating!.count} reviews)',
                            style: TextStyles.instance.baseRating,
                          ),
                          Visibility(
                            visible: widget.isHomePage,
                            child: Expanded(
                              child: BlocBuilder<HomeController, HomeState>(
                                builder: (context, state) {
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          controller.addFavorite(
                                              widget.product.id!,
                                              state.favoriteList);
                                        },
                                        icon: Icon(
                                          state.favoriteList.contains(
                                                  widget.product.id.toString())
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 24,
                                        ),
                                        color: state.favoriteList.contains(
                                                widget.product.id.toString())
                                            ? ColorsApp.instance.favoriteColor
                                            : ColorsApp.instance.blackNormal,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: AutoSizeText(
                        'R\$${widget.product.price!.toStringAsFixed(2)}',
                        style: TextStyles.instance.basePrice,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
