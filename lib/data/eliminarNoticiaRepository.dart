import 'package:http/http.dart';

class EliminarNoticiaRepository {
  Future eliminarNoticia(id) async {
    Response response =
        await delete(Uri.parse('http://192.168.1.84:8080/api/news/$id/'));
    final data = response.body;
    return data;
  }
}
