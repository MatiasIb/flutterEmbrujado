import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopNav extends StatelessWidget {
  const TopNav({Key? key, int flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
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
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bookmark)),
        ]),
      ),
    );
  }
}

/* 
          ],
          backgroundColor: Colors.transparent,
          leading:  */