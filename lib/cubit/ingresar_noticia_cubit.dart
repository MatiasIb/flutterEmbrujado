import 'package:bloc/bloc.dart';
import 'package:noticias/data/agregarNoticia.dart';
import 'package:noticias/data/editarNoticia.dart';
part 'ingresar_noticia_state.dart';

class IngresarNoticiaCubit extends Cubit<IngresarNoticiaState> {
  IngresarNoticiaCubit() : super(IngresarNoticiaState.initial());

  void actualizarImages(images) {
    emit(state.copyWidth(images: images));
  }

  void actualizarImageEditar(imagenes) {
    emit(state.copyWidth(images: imagenes));
  }

  //editarNoticia por id
  Future<void> editarNoticia(id, title, body, imagen) async {
    emit(IngresarNoticiaState(status: IngresarNoticiasListStatus.loading));
    //print(state.images.toString());
    //print('aqui');
    try {
      await EditarNoticia()
          .editarNoticia(id, title, body, imagen, state.images);
    } on Exception catch (exception) {
      emit(IngresarNoticiaState(
          status: IngresarNoticiasListStatus.failure, exception: exception));
    }
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
      emit(IngresarNoticiaState(
          status: IngresarNoticiasListStatus.failure, exception: exception));
    }
  }
}
