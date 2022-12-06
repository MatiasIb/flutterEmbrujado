import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'dart:convert';

import '../models/noticia.dart';

class NoticiasRepository {
  Future<List<Noticia>> fetchNoticia() async {
    Response response =
        await get(Uri.parse('http://10.15.15.64:8000/api/news/'));
    final data = jsonDecode(response.body);
    return List<Noticia>.from(data.map((item) => Noticia.fromJson(item)));
  }
}
