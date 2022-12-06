import 'package:flutter/material.dart';

class ListBar extends StatefulWidget {
  const ListBar({Key? key}) : super(key: key);

  @override
  _ListBarState createState() => _ListBarState();
}

class _ListBarState extends State<ListBar> {
  final List<bool> isSelected = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 25.0,
        child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                child: ToggleButtons(
                  borderWidth: 0,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  selectedBorderColor: Colors.blueAccent[100],
                  isSelected: isSelected,
                  children: const <Widget>[
                    Text('    Current News    '),
                    Text('    World News    '),
                    Text('    Politics    '),
                    Text('    Sports    '),
                    Text('    Economy    '),
                    Text('    Horoscopo    '),
                    Text('    Actualidad    ')
                  ],
                ),
              )
            ]));
  }
}

/*  SizedBox(
            width: 15,
          ),
          Container(
            child: Text('Current News'),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text('World News'),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text('Politics'),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text('Sports'),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: Text('Economy'),
          ),
          SizedBox(
            width: 30,
          ),
 */
