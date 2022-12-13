import 'package:http/http.dart';
import 'dart:convert';

class EditarNoticia {
  Future<Response> editarNoticia(id, title, body, imagen, listImagen) async {
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
        await put(Uri.parse('http://10.15.15.64:8000/api/news/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(datos));
    return response;
  }
}
