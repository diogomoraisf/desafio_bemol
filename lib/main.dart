import 'package:desafio_bemol/app/core/env/env.dart';
import 'package:desafio_bemol/app/pages/desafio_bemol.dart';
import 'package:desafio_bemol/app/services/shared_preferences_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await Env.i.load();
  // define apenas orientação Portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // carrega instacia do shared preferences
  initiateSharedPreferences();
  runApp(const DesafioBemol());
}
