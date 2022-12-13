import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:noticias/cubit/noticias_cubit.dart';
import 'dart:convert';
import '../models/noticia.dart';

class EliminarNoticiaRepository {
  Future eliminarNoticia(id) async {
    Response response =
        await delete(Uri.parse('http://10.15.15.64:8000/api/news/$id/'));
    final data = response.body;
    return data;
  }
}
