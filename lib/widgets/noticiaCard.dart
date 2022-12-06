import 'package:flutter/material.dart';

class NoticiaCard extends StatelessWidget {
  final int? id;
  final String? title;
  final String? body;
  final String? image;
  final String? mes;
  final String? dia;
  final String? ano;
  const NoticiaCard(
      {Key? key,
      this.id,
      this.title,
      this.body,
      this.image,
      this.mes,
      this.ano,
      this.dia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600, spreadRadius: 1, blurRadius: 3)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image == 'null'
                    ? 'https://i.ibb.co/d6xGbW2/sin-imagen.jpg'
                    : '${image}',
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${title}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${body}',
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text('Subido: ${dia}-${mes}-${ano}'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/* Image.network(
              'https://i.ibb.co/vZXQhth/3ec0aec02fe83050d64733f5b19f1b00.jpg',
              width: 70,
              height: 100,
              fit: BoxFit.fitHeight,
            ), */