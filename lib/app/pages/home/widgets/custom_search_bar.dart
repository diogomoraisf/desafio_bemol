import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:desafio_bemol/app/pages/home/home_controller.dart';
import 'package:desafio_bemol/app/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      builder: (context, state) {
        HomeController controller = context.read<HomeController>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                hintText: 'Busque seu produto...',
                hintStyle: TextStyles.instance.baseHint,
                filled: true,
                fillColor: ColorsApp.instance.filledColor,
                suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.black45,
                    onPressed: () {
                      searchController.clear();
                      controller.runFilter(state.listaProdutos, '');
                    }),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.black87,
                  onPressed: () {
                    // Perform the search here
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                )),
            onChanged: (value) =>
                controller.runFilter(state.listaProdutos, value),
          ),
        );
      },
    );
  }
}
