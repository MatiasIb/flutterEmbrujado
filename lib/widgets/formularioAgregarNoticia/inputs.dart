import 'package:flutter/material.dart';

class Inputs extends StatelessWidget {
  final ValueChanged? title;
  final String? titleValue;
  final ValueChanged? body;
  final String? bodyValue;
  const Inputs(
      {Key? key, this.title, this.body, this.titleValue, this.bodyValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: TextFormField(
            initialValue: titleValue,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 4, color: Colors.grey..shade600),
                    borderRadius: BorderRadius.circular(50.0)),
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
          child: TextFormField(
            initialValue: bodyValue,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 4, color: Colors.grey..shade600),
                    borderRadius: BorderRadius.circular(50.0)),
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
