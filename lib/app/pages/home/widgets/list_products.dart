import 'package:auto_size_text/auto_size_text.dart';
import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  final List<ProductModel> listaProdutos;
  const ListProducts({super.key, required this.listaProdutos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: listaProdutos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          constraints: const BoxConstraints(maxHeight: 140),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  constraints: const BoxConstraints(maxHeight: 130),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image(
                      image: NetworkImage(listaProdutos[index].image!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: AutoSizeText(
                          '${listaProdutos[index].title}',
                          maxLines: 2,
                          style: TextStyles.instance.baseDescription,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
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
                              '${listaProdutos[index].rating!.rate} ',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            AutoSizeText(
                              '(${listaProdutos[index].rating!.count} reviews)',
                              style: const TextStyle(color: Colors.black54),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.favorite,
                                    color: ColorsApp.instance.favoriteColor,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: AutoSizeText(
                          'R\$${listaProdutos[index].price!.toStringAsFixed(2)}',
                          style: TextStyles.instance.basePrice,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
