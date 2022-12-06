import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:noticias/cubit/ingresar_noticia_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotonGuardar extends StatelessWidget {
  final String? title;
  final String? body;
  final String? imagen;
  final List? listImagen;
  const BotonGuardar(
      {Key? key, this.title, this.body, this.imagen, this.listImagen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngresarNoticiaCubit, IngresarNoticiaState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Container(
          width: 120,
          height: 50,
          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  shadowColor: Colors.grey,
                  elevation: 5),
              onPressed: () => context
                  .read<IngresarNoticiaCubit>()
                  .guardar(title, body, imagen),
              child: Text('Guardar')),
        );
      },
    );
  }
}


/*
    ); */