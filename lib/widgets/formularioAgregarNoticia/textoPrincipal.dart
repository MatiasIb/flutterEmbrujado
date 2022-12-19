import 'package:flutter/material.dart';

class TextoPrincipal extends StatelessWidget {
  final String textoPrincipal;
  const TextoPrincipal({Key? key, required this.textoPrincipal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 80,
        width: 250,
        child: FittedBox(
          child: Text(
            'Agregar Noticias',
            textAlign: TextAlign.center,
          ),
        ));
  }
}
