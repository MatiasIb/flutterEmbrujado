import 'package:bloc/bloc.dart';
import 'package:noticias/data/NoticiasRepository.dart';
import 'package:noticias/data/eliminarNoticiaRepository.dart';
import 'package:noticias/data/traerUnaNoticia.dart';
import 'package:noticias/models/models.dart';

part 'noticias_state.dart';

class NoticiasCubit extends Cubit<NoticiasState> {
  NoticiasCubit() : super(NoticiasState.initial());
  List<Result> noticias = [];
  String route = 'http://192.168.1.84:8080/api/news/?page=1';

  Future<void> joinNoticias() async {
    try {
      //final data = await NoticiasRepository().fetchNoticia();
      // loading == true

      /**
      *al consultar api para obtener noticias llenamos por primera vez la lista noticias
      * si next != null && isloading == true cambiamos la ruta del fetch y consumimos la siguiente paginación
      * si next == null, detenemos el scroll. 
      */

      // al obtener la data, hay que llenar el arreglo
      // state.noticia= resultado ...
      // state.noticia.results[]

      /**
      *  status : blabla success,
        * noticia : [state.noticia ...data]
        isloading : false
       */

      /*
      emit(NoticiasState(
          status: NoticiasListStatus.success, noticia: data));
          */
    } on Exception catch (_) {
      //print("exception: $exception");
      // isloading: false
      /*
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
          */
    }
  }

  //eliminarNoticia por id
  Future<void> eliminarNoticia(id) async {
    emit(NoticiasState(status: NoticiasListStatus.loading));

    try {
      await EliminarNoticiaRepository().eliminarNoticia(id);
    } on Exception catch (exception) {
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
    }
  }

  //traerUnaNoticia al seleccionar esa noticia
  Future<void> traerUnaNoticia(id) async {
    emit(NoticiasState(status: NoticiasListStatus.loading));
    try {
      final noticia = await TraerUnaNoticia().fetchUnaNoticia(id);
      emit(NoticiasState(
          status: NoticiasListStatus.success, noticiaDetail: noticia));
    } on Exception catch (exception) {
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
    }
  }

  //traerTodasLasNoticiasDelLogin
  Future fetchNoticias() async {
    (NoticiasState(status: NoticiasListStatus.loading));

    /* String? route = state.noticia!.next != null
        ? 'http://192.168.1.84:8080/api/news/?page=1'
        : state.noticia!.next; */

    try {
      final noticiaList = await NoticiasRepository().fetchNoticia();
      noticiaList.results.forEach((element) {
        noticias.add(element);
      });
      emit(NoticiasState(
          status: NoticiasListStatus.success,
          noticiaResult: noticias,
          noticia: noticiaList));
    } on Exception catch (exception) {
      emit(NoticiasState(
          status: NoticiasListStatus.failure, exception: exception));
    }
  }
}
