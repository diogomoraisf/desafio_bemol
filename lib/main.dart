import 'package:desafio_bemol/app/core/env/env.dart';
import 'package:desafio_bemol/app/pages/desafio_bemol.dart';
import 'package:desafio_bemol/app/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await Env.i.load();
  // define apenas orientação Portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // carrega instacia do shared preferences
  await initiateSharedPreferences();
  runApp(const DesafioBemol());
}
