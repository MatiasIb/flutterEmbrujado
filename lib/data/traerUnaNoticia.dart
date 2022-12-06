import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import '../models/noticia.dart';

class TraerUnaNoticia {
  Future<List<Noticia>> fetchUnaNoticia() async {
    Response response =
        await get(Uri.parse('http://10.15.15.64:8000/api/news/1/'));
    final data = jsonDecode(response.body);
    print('data' + data);
    return List<Noticia>.from(data.map((item) => Noticia.fromJson(item)));
  }
}
