import 'package:desafio_bemol/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader() {
    if (isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
              color: ColorsApp.instance.corPrimaria, size: 50),
        ),
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
