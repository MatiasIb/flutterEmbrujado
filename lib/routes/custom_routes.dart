import 'package:flutter/material.dart';
import 'package:noticias/pages/formularioAgregarNoticia.dart';
import 'package:noticias/pages/formularioEditarNoticia.dart';
import 'package:noticias/pages/menuPerfil.dart';
import 'package:noticias/pages/MostrarUnaNoticia.dart';
import 'package:noticias/pages/welcome.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NoticiasListView.routeName:
        return NoticiasListView.route();
      case MenuPerfil.routeName:
        return MenuPerfil.route();
      case FormularioAgregarNoticia.routeName:
        return FormularioAgregarNoticia.route();
      case MostrarUnaNoticia.routeName:
        return MostrarUnaNoticia.route(
          args: settings.arguments as MostrarUnaNoticiaArgs,
        );
      case FormularioEditarNoticia.routeName:
        return FormularioEditarNoticia.route(
          args: settings.arguments as FormularioEditarNoticiaArgs,
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No esta definida esa ruta: ${settings.name}'),
                  ),
                ));
    }
  }
}
