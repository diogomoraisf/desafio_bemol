import 'package:desafio_bemol/app/core/provider/aplication_binding.dart';
import 'package:desafio_bemol/app/pages/home/home_router.dart';
import 'package:flutter/material.dart';

class DesafioBemol extends StatelessWidget {
  const DesafioBemol({super.key});

  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
        child: MaterialApp(
      title: 'Products',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routes: {'/': (context) => HomeRouter.page},
    ));
  }
}
