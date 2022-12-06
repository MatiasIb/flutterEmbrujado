part of 'noticias_cubit.dart';

enum NoticiasListStatus { initial, loading, success, failure }

class NoticiasState {
  final NoticiasListStatus? status;
  final List<Noticia>? noticia;
  final Exception? exception;

  factory NoticiasState.initial() => NoticiasState();

  NoticiasState(
      {this.status = NoticiasListStatus.initial, this.noticia, this.exception});
  NoticiasState copyWidth(
      {NoticiasListStatus? status,
      List<Noticia>? noticia,
      Exception? exception}) {
    return NoticiasState(
        status: status ?? this.status,
        noticia: noticia ?? this.noticia,
        exception: exception ?? this.exception);
  }
}
