import 'package:flutter/material.dart';
import 'package:noticias/widgets/noticiaCard.dart';

class NoticiaSeccion extends StatelessWidget {
  final int? id;
  final String? title;
  final String? body;
  final String? image;
  final String? mes;
  final String? dia;
  final String? ano;
  const NoticiaSeccion(
      {Key? key,
      this.id,
      this.title,
      this.body,
      this.image,
      this.mes,
      this.dia,
      this.ano})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoticiaCard(
          title: title,
          body: body,
          image: image,
          mes: mes,
          ano: ano,
          dia: dia,
        ),
      ],
    );
  }
}
