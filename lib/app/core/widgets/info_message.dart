import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class InfoMessage extends StatelessWidget {
  final String message;
  const InfoMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.threeArchedCircle(
                color: ColorsApp.instance.corPrimaria, size: 50),
            Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
