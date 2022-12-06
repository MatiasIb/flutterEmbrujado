import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopNavUnaNoticia extends StatelessWidget {
  const TopNavUnaNoticia({Key? key, int flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 60,
        child: Row(children: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.bars),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.trash)),
        ]),
      ),
    );
  }
}
