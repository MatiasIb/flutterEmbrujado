import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:noticias/models/models.dart';

import 'dart:convert';

class NoticiasRepository {
  Future fetchNoticia() async {
    var url = Uri.http('10.15.15.64:8000', '/api/news/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final noticiasTraidas = NewNoticia.fromJson(json.decode(response.body));
      return noticiasTraidas;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
