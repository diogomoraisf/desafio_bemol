import 'package:desafio_bemol/app/core/env/env.dart';
import 'package:desafio_bemol/app/pages/desafio_bemol.dart';
import 'package:flutter/material.dart';

void main() async {
  await Env.i.load();
  runApp(const DesafioBemol());
}
