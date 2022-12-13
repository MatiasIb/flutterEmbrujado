import 'package:flutter/material.dart';
import 'package:noticias/cubit/ingresar_noticia_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class BotonEditar extends StatelessWidget {
  final int? id;
  final String? title;
  final String? body;
  final String? imagen;
  final List? listImagen;
  const BotonEditar(
      {Key? key, this.title, this.body, this.imagen, this.listImagen, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngresarNoticiaCubit, IngresarNoticiaState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox(
          width: 120,
          height: 50,
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shadowColor: Colors.grey,
                  elevation: 5),
              onPressed: () {
                print('imagenes: ' + state.images!.length.toString());
                context
                    .read<IngresarNoticiaCubit>()
                    .editarNoticia(id, title, body, imagen);
              },
              child: const Text('Guardar')),
        );
      },
    );
  }
}
