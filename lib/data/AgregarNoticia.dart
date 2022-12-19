import 'package:http/http.dart';
import 'dart:convert';

class AgregarNoticia {
  Future<Response> ingresarNoticia(title, body, imagen, listImagen) async {
    final List<Map> list = [];
    for (var i = 0; i < listImagen.length; i++) {
      list.add({"image": listImagen[i]});
    }
    var datos = {
      'title': title,
      'body': body,
      'main_image': imagen,
      'images': list
    };
    Response response =
        await post(Uri.parse('http://192.168.1.84:8080/api/news/'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(datos));
    return response;
  }
}
