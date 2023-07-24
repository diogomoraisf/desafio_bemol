import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ListEmpty extends StatelessWidget {
  final String infoMessage;
  const ListEmpty({super.key, required this.infoMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/list_empty.png'),
          height: 160,
          width: 160,
        ),
        Center(
          child: Text(
            infoMessage,
            textAlign: TextAlign.center,
            style: TextStyles.instance.infoError,
          ),
        )
      ],
    );
  }
}
