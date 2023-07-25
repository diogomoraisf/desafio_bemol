import 'package:desafio_bemol/app/core/ui/base_state/base_state.dart';
import 'package:desafio_bemol/app/core/widgets/custom_app_bar.dart';
import 'package:desafio_bemol/app/core/widgets/list_empty.dart';
import 'package:desafio_bemol/app/core/widgets/product_item.dart';
import 'package:desafio_bemol/app/models/product_model.dart';
import 'package:desafio_bemol/app/pages/favorites/favorites_controller.dart';
import 'package:desafio_bemol/app/pages/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  final List<ProductModel> listaProdutos;
  const FavoritesPage({super.key, required this.listaProdutos});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends BaseState<FavoritesPage, FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Favoritos',
          hideBackButton: false,
        ),
        body: BlocConsumer<FavoritesController, FavoritesState>(
          listener: (context, state) {
            state.status.matchAny(
              any: () => hideLoader(),
            );
          },
          builder: (context, state) {
            if (state.favoriteList.isEmpty) {
              return const ListEmpty(
                  infoMessage: 'Você não tem nenhum \nproduto favorito ;(');
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) => state
                            .favoriteList
                            .contains(widget.listaProdutos[index].id.toString())
                        ? const Divider()
                        : const SizedBox(),
                    itemCount: widget.listaProdutos.length,
                    itemBuilder: (context, index) {
                      if (state.favoriteList.contains(
                          widget.listaProdutos[index].id.toString())) {
                        return ProductItem(
                            product: widget.listaProdutos[index],
                            isHomePage: false);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              );
            }
          },
        ));
  }
}
