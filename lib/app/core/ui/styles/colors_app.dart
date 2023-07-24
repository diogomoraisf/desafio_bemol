import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get corPrimaria => const Color.fromARGB(243, 122, 32, 1);
  Color get blackNormal => const Color.fromRGBO(55, 71, 79, 1);
  Color get blackMedium => const Color.fromRGBO(55, 71, 79, 0.72);
  Color get filledColor => const Color.fromRGBO(240, 241, 242, 1);
  Color get linkColor => const Color.fromRGBO(51, 102, 204, 1);
  Color get ratingColor => const Color.fromRGBO(255, 215, 0, 1);
  Color get favoriteColor => const Color.fromRGBO(255, 0, 0, 1);
}
