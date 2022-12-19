// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(25);
    return TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(198, 221, 225, 1),
                  borderRadius: borderRadius),
              child: ClipRRect(
                borderRadius: borderRadius,
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40),
                  child: Image.asset(
                    'assets/images/science-banner.jpg',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
            const Text('Science')
          ],
        ));
  }
}
