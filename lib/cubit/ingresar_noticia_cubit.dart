import 'package:bloc/bloc.dart';
import 'package:noticias/data/agregarNoticia.dart';
part 'ingresar_noticia_state.dart';

class IngresarNoticiaCubit extends Cubit<IngresarNoticiaState> {
  IngresarNoticiaCubit() : super(IngresarNoticiaState.initial());

  void actualizarImages(images) {
    emit(state.copyWidth(images: images));
  }

  Future<void> guardar(title, body, imagen) async {
    try {
      final agregarNoticia = await AgregarNoticia()
          .ingresarNoticia(title, body, imagen, state.images);
      if (agregarNoticia.statusCode == 201) {
        emit(IngresarNoticiaState(status: IngresarNoticiasListStatus.success));
      } else if (agregarNoticia.statusCode == 400) {
        emit(IngresarNoticiaState(status: IngresarNoticiasListStatus.failure));
      }
    } on Exception catch (exception) {
      print("error " + exception.toString());
      emit(IngresarNoticiaState(
          status: IngresarNoticiasListStatus.failure, exception: exception));
    }
  }
}
