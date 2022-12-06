import 'package:flutter/material.dart';

class TextoPrincipal extends StatelessWidget {
  const TextoPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 250,
        child: const FittedBox(
          child: Text(
            'Agregar Noticias',
            textAlign: TextAlign.center,
          ),
        ));
  }
}
