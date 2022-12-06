import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticias/pages/menuPerfil.dart';
import 'package:noticias/pages/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(
            width: 80.0,
          ),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.house)),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MenuPerfil.routeName);
              },
              icon: const FaIcon(FontAwesomeIcons.user)),
          const SizedBox(
            width: 80.0,
          ),
        ],
      ),
    );
  }
}




/* 
  bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill), label: 'House'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.map_pin), label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill), label: 'Perfil')
      ]),
      
 */