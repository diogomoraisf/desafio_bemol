import 'package:desafio_bemol/app/core/ui/base_state/base_state.dart';
import 'package:desafio_bemol/app/core/widgets/custom_app_bar.dart';
import 'package:desafio_bemol/app/core/widgets/info_message.dart';
import 'package:desafio_bemol/app/core/widgets/list_empty.dart';
import 'package:desafio_bemol/app/pages/home/home_controller.dart';
import 'package:desafio_bemol/app/pages/home/home_state.dart';
import 'package:desafio_bemol/app/pages/home/widgets/custom_search_bar.dart';
import 'package:desafio_bemol/app/pages/home/widgets/list_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Produtos',
        hideBackButton: true,
        menuItem: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  controller.state.listaProdutos.isNotEmpty
                      ? Navigator.of(context).pushNamed('favorites',
                          arguments: {
                              'listaProdutos': controller.state.listaProdutos
                            })
                      : null;
                },
                icon: const Icon(
                  Icons.favorite_border,
                  size: 24,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('error', (route) => false);
            },
          );
        },
        builder: (context, state) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSearchBar(),
              ),
              state.status.name != 'loading'
                  ? state.filterProdutos.isEmpty
                      ? const Expanded(
                          child: ListEmpty(
                              infoMessage:
                                  'Nenhum produto encontrado.\n Refine a sua busca.'),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: state.listaProdutos.isNotEmpty
                                ? Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 25.0),
                                    child: ListProducts(
                                      listaProdutos: state.filterProdutos,
                                      favoriteList: state.favoriteList,
                                    ),
                                  )
                                : null,
                          ),
                        )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child:
                          const InfoMessage(message: 'Carregando produtos..'))
            ],
          );
        },
      ),
    );
  }
}
