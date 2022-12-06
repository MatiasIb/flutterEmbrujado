import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noticias/data/NoticiasRepository.dart';
import 'package:noticias/data/traerUnaNoticia.dart';
import 'package:noticias/models/models.dart';

part 'noticias_state.dart';

class NoticiasCubit extends Cubit<NoticiasState> {
  NoticiasCubit() : super(NoticiasState.initial());

  //eliminarNoticia por id

  Future<void> eliminarNoticia(id) async {
    emit(NoticiasState(status: NoticiasListStatus.loading));
  }

  //traerUnaNoticia al seleccionar esa noticia
  Future<void> traerUnaNoticia(id) async {
    print("id: =>" + id);
    emit(NoticiasState(status: NoticiasListStatus.loading));
    try {
      final _noticia = await TraerUnaNoticia().fetchUnaNoticia();
      print(_noticia);
      emit(
          NoticiasState(status: NoticiasListStatus.success, noticia: _noticia));
    } on Exception catch (exception) {
      print("exception => " + exception.toString());
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
    }
  }

  //traerTodasLasNoticiasDelLogin
  Future<void> fetchNoticias() async {
    emit(NoticiasState(status: NoticiasListStatus.loading));

    try {
      final NoticiaList = await NoticiasRepository().fetchNoticia();
      emit(NoticiasState(
          status: NoticiasListStatus.success, noticia: NoticiaList));
    } on Exception catch (exception) {
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
    }
  }
}
