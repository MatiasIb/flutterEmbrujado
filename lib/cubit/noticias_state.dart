part of 'noticias_cubit.dart';

enum NoticiasListStatus { initial, loading, success, failure }

class NoticiasState {
  final NoticiasListStatus? status;
  final NewNoticia? noticia;
  final Exception? exception;
  final Noticia? noticiaDetail;
  final List<Result>? noticiaResult;
  final bool? isLoading;

  factory NoticiasState.initial() => NoticiasState();

  NoticiasState({
    this.status = NoticiasListStatus.initial,
    this.noticiaResult,
    this.noticia,
    this.exception,
    this.noticiaDetail,
    this.isLoading = false,
  });

  NoticiasState copyWidth({
    List<Result>? noticiaResult,
    NoticiasListStatus? status,
    NewNoticia? noticia,
    Exception? exception,
    Noticia? noticiaDetail,
    bool? isLoading,
  }) {
    return NoticiasState(
      noticiaResult: noticiaResult ?? this.noticiaResult,
      status: status ?? this.status,
      noticia: noticia ?? this.noticia,
      exception: exception ?? this.exception,
      noticiaDetail: noticiaDetail ?? this.noticiaDetail,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
