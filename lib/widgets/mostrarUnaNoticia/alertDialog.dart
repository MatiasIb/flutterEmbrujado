import 'package:flutter/material.dart';

import '../../data/eliminarNoticiaRepository.dart';

eliminarDialog(context, id) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Eliminar noticia'),
        content: const Text('¿Estás seguro de que quieres eliminar esta noticia?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              EliminarNoticiaRepository().eliminarNoticia(id);
            },
            child: const Text('Eliminar'),
          ),
        ],
      );
    },
  );
}
