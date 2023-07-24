import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/error.png'),
                    height: 160,
                    width: 160,
                  ),
                  Text(
                    'Oops.. algo deu errado!',
                    style: TextStyles.instance.infoError,
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Text('Tentar Novamente',
                    style: TextStyles.instance.linkHome),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
