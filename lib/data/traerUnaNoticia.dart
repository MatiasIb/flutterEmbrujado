import 'package:http/http.dart';

import 'dart:convert';

import '../models/noticia.dart';

class TraerUnaNoticia {
  Future<Noticia> fetchUnaNoticia(id) async {
    Response response =
        await get(Uri.parse('http://192.168.1.84:8080/api/news/$id/'));
    final data = jsonDecode(response.body);
    //print('data' + data.toString());
    return Noticia.fromJson(data);
  }
}
