import 'package:flutter/material.dart';

class ContenidoMostrarUnaNoticia extends StatelessWidget {
  const ContenidoMostrarUnaNoticia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(
            'https://i.ibb.co/4V5hnsP/istockphoto-1035676256-612x612.jpg',
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Text(
            'asd',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ],
    );
  }
}
