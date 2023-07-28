import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductSingle extends StatelessWidget {
  final ProductModel productData;
  const ProductSingle({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 310),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: productData.id!,
              child: Image.network(
                productData.image!,
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
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
            child: AutoSizeText(
              productData.title!,
              style: TextStyles.instance.baseTitleProduct,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: ColorsApp.instance.ratingColor,
                  size: 25,
                ),
                const VerticalDivider(width: 6),
                AutoSizeText(
                  '${productData.rating!.rate} ',
                  style: TextStyles.instance.baseRating,
                ),
                AutoSizeText(
                  '(${productData.rating!.count} reviews)',
                  style: TextStyles.instance.baseRating,
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'R\$${productData.price!.toStringAsFixed(2)}',
                    style: TextStyles.instance.basePriceSingle,
                  ),
                ))
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Icon(
                Icons.sort,
                size: 25,
                color: ColorsApp.instance.blackNormal,
              ),
              const VerticalDivider(width: 6),
              AutoSizeText(
                productData.category!,
                style: TextStyles.instance.baseDescription,
              )
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.menu,
                size: 25,
                color: ColorsApp.instance.blackNormal,
              ),
              const VerticalDivider(width: 6),
              Expanded(
                child: AutoSizeText(
                  productData.description!,
                  //maxLines: 5,
                  style: TextStyles.instance.baseDescription,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
