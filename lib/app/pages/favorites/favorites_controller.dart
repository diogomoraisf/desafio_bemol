import 'package:desafio_bemol/app/pages/favorites/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesController extends Cubit<FavoritesState> {
  FavoritesController() : super(FavoritesState.initial());

  Future<void> getProducts() async {}
}
