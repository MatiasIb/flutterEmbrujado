import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/cubit/noticias_cubit.dart';

class TopNavPerfil extends StatelessWidget {
  const TopNavPerfil({Key? key, int flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bookmark)),
        ]),
      ),
    );
  }
}
