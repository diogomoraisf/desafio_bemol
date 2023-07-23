import 'package:desafio_bemol/app/core/ui/base_state/base_state.dart';
import 'package:desafio_bemol/app/pages/home/home_controller.dart';
import 'package:desafio_bemol/app/pages/home/home_state.dart';
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
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ??
                  'Erro inesperado. Tente novamente mais tarde');
            },
          );
        },
        builder: (context, state) {
          return Center(
            child: state.listaProdutos.isNotEmpty
                ? ListView.builder(
                    itemCount: state.listaProdutos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        '${state.listaProdutos[index].title}',
                        style: const TextStyle(color: Colors.black),
                      );
                    },
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
