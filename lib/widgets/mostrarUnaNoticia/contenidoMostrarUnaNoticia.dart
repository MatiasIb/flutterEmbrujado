import 'package:flutter/material.dart';

class ContenidoMostrarUnaNoticia extends StatelessWidget {
  final String? mainImage;
  final String? title;
  final String? body;
  final List? images;
  const ContenidoMostrarUnaNoticia(
      {Key? key, this.mainImage, this.title, this.body, this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xffedf4ff)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        minimumSize: MaterialStateProperty.all(const Size(130, 50)));
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(
            '$mainImage',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            fit: BoxFit.cover,
          ),
        ),
        titulo(context, title),
        detalles(context, style, body, images)
      ],
    );
  }
}

Widget detalles(context, style, body, images) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50))),
    height: MediaQuery.of(context).size.height,
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          buttonPrimary(style),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('About',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text('Read more',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '$body',
            style: const TextStyle(color: Colors.black, fontSize: 25),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length ?? 0,
              pageSnapping: true,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  margin: const EdgeInsets.all(10),
                  child: images.length == null
                      ? const Text("No tiene mas Imagenes")
                      : Image.network('${images[index]['image']}'),
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget titulo(context, title) {
  return Padding(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 2.5, left: 20),
    child: Text(
      '$title',
      style: const TextStyle(color: Colors.white, fontSize: 30),
    ),
  );
}

Widget buttonPrimary(style) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextButton(
          style: style,
          onPressed: null,
          child: Row(
            children: const [Icon(Icons.access_time_rounded), Text('6 min')],
          )),
      TextButton(
          style: style,
          onPressed: null,
          child: Row(
            children: const [Icon(Icons.remove_red_eye_outlined), Text('1k views')],
          ))
    ],
  );
}
