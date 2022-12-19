part of 'ingresar_noticia_cubit.dart';

enum IngresarNoticiasListStatus { initial, loading, success, failure }

class IngresarNoticiaState {
  final IngresarNoticiasListStatus? status;
  final String? title;
  final String? body;
  final Exception? exception;
  final List? images;

  factory IngresarNoticiaState.initial() => IngresarNoticiaState();

  IngresarNoticiaState(
      {this.status = IngresarNoticiasListStatus.initial,
      this.title,
      this.body,
      this.exception,
      this.images});
  IngresarNoticiaState copyWidth({
    IngresarNoticiasListStatus? status,
    String? title,
    String? body,
    Exception? exception,
    List<String>? images,
  }) {
    return IngresarNoticiaState(
        status: status ?? this.status,
        title: title ?? this.title,
        body: body ?? this.body,
        exception: exception ?? this.exception,
        images: images ?? this.images);
  }
}
