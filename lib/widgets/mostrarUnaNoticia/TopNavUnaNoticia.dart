import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/models/models.dart';
import 'package:noticias/pages/formularioEditarNoticia.dart';
import 'package:noticias/widgets/mostrarUnaNoticia/alertDialog.dart';

class TopNavUnaNoticia extends StatelessWidget {
  final Noticia? noticia;
  final int? id;
  const TopNavUnaNoticia({Key? key, int flex = 1, this.id, this.noticia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    FormularioEditarNoticia.routeName,
                    arguments: FormularioEditarNoticiaArgs(noticia: noticia));
              },
              icon: const FaIcon(FontAwesomeIcons.penToSquare)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                eliminarDialog(context, id);
              },
              icon: const FaIcon(FontAwesomeIcons.trash)),
        ]),
      ),
    );
  }
}
