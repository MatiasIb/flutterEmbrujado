import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopNavPerfil extends StatelessWidget {
  const TopNavPerfil({Key? key, int flex = 1}) : super(key: key);

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
