import 'package:flutter/material.dart';
import 'package:noticias/widgets/categoriesSelector.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: const [
            CategoriesSelector(),
            SizedBox(
              width: 13,
            ),
            CategoriesSelector(),
            SizedBox(
              width: 13,
            ),
            CategoriesSelector(),
            SizedBox(
              width: 13,
            ),
            CategoriesSelector(),
            SizedBox(
              width: 13,
            ),
            CategoriesSelector(),
            SizedBox(
              width: 13,
            ),
            CategoriesSelector(),
          ]),
    );
  }
}


/*  Container(
          margin: const EdgeInsets.only(top: 20),
          height: 115.0,
          child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[Categories()]),
        ), */