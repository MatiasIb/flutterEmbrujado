import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  final ValueChanged? title;
  final ValueChanged? body;
  const Inputs({Key? key, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Ingrese el titulo de la notica',
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 4, color: Colors.grey..shade600),
                    borderRadius: BorderRadius.circular(50.0))),
            onChanged: title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Ingrese la descripcion de la noticia',
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 4, color: Colors.grey..shade600),
                    borderRadius: BorderRadius.circular(50.0))),
            onChanged: body,
          ),
        ),
      ],
    );
  }
}
