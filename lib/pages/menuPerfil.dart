import 'package:flutter/material.dart';
import 'package:noticias/pages/formularioAgregarNoticia.dart';
import 'package:noticias/widgets/topNavPerfil.dart';

class MenuPerfil extends StatefulWidget {
  static const String routeName = "/menuPerfil";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MenuPerfil());
  }

  const MenuPerfil({Key? key}) : super(key: key);

  @override
  _MenuPerfil createState() => _MenuPerfil();
}

class _MenuPerfil extends State<MenuPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const TopNavPerfil(),
        ClipOval(
          child: Image.network(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(FormularioAgregarNoticia.routeName);
            },
            child: const Text('Agregar Nueva Noticia'))
      ]),
    );
  }
}
