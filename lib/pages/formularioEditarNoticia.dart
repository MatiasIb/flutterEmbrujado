import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/cubit/ingresar_noticia_cubit.dart';
import 'package:noticias/models/models.dart';
import 'package:noticias/widgets/formularioAgregarNoticia/inputs.dart';
import 'package:noticias/widgets/formularioAgregarNoticia/textoPrincipal.dart';
import 'package:noticias/widgets/formularioEditarNoticia/botonEditar.dart';
import 'package:noticias/widgets/topNavPerfil.dart';
import 'package:image_picker/image_picker.dart';

class FormularioEditarNoticiaArgs {
  final Noticia? noticia;

  const FormularioEditarNoticiaArgs({this.noticia});
}

ImagePicker picker = ImagePicker();

class FormularioEditarNoticia extends StatefulWidget {
  static const String routeName = "/editar";
  final Noticia? noticia;

  static Route route({required FormularioEditarNoticiaArgs args}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return BlocProvider<IngresarNoticiaCubit>(
            create: (_) => IngresarNoticiaCubit(),
            child: FormularioEditarNoticia(
              noticia: args.noticia,
            ),
          );
        });
  }

  const FormularioEditarNoticia({Key? key, this.noticia}) : super(key: key);

  @override
  State<FormularioEditarNoticia> createState() =>
      FormularioEditarNoticiaState();
}

class FormularioEditarNoticiaState extends State<FormularioEditarNoticia> {
  //final Noticia? noticia;
  String? title;
  String? body;
  String? baseImage;
  File? _image;
  List<dynamic>? _images;

  //FormularioEditarNoticiaState(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<IngresarNoticiaCubit, IngresarNoticiaState>(
      listener: (context, state) {
        if (state.status == IngresarNoticiasListStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Se ha ingresado la noticia con exito')),
          );
        } else if (state.status == IngresarNoticiasListStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error del servidor. ${state.exception}')),
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case IngresarNoticiasListStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return SingleChildScrollView(
              child: Column(
                children: [
                  const TopNavPerfil(),
                  const TextoPrincipal(
                    textoPrincipal: 'Editar Noticia',
                  ),
                  inputs(),
                  TextButton(
                    child: const Text("Seleccione una foto desde la galeria"),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                  TextButton(
                    child: const Text("llenar"),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  Container(
                    child: _image == null
                        ? Image.network(
                            widget.noticia!.mainImage as String,
                            width: 100,
                            height: 100,
                          )
                        : Image.file(
                            _image!,
                            width: 100,
                            height: 100,
                          ),
                  ),
                  TextButton(
                    child:
                        const Text("Seleccione varias fotos desde la galeria"),
                    onPressed: () {
                      multiplePickImage();
                    },
                  ),
                  SizedBox(
                    height: 100,
                    child: _images == null
                        ? const Text('No has seleccionado imagenes.')
                        : ListView.builder(
                            itemCount: _images == null ? 0 : _images!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Image.file(
                                _images![index],
                                width: 100,
                                height: 100,
                              );
                            },
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  boton(state),
                ],
              ),
            );
        }
      },
    ));
  }

  Widget inputs() {
    return Inputs(
      titleValue: widget.noticia!.title,
      title: ((value) {
        setState(() {
          title = value;
        });
      }),
      bodyValue: widget.noticia!.body,
      body: (value) {
        setState(() {
          body = value;
        });
      },
    );
  }

  Widget boton(IngresarNoticiaState state) {
    return BotonEditar(
        id: widget.noticia!.id,
        title: title,
        body: body,
        imagen: baseImage ?? widget.noticia!.mainImage);
  }

  Future pickImage() async {
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        _image = File(image.path);
      });

      final bytes = await image.readAsBytes();
      final image64 = base64Encode(bytes);
      setState(() => baseImage = image64);
    } catch (_) {
      //print('Fallo al seleccionar la imagen: $e');
    }
  }

  Future multiplePickImage() async {
    final List<String> lista = [];
    try {
      var image = await picker.pickMultiImage();
      setState(() {
        _images = image.map((e) => File(e.path)).toList();
      });
      for (int i = 0; i < image.length; i++) {
        final bytes = await image[i].readAsBytes();
        final image64 = base64Encode(bytes);
        lista.add(image64);
      }
      if (!mounted) return;
      context.read<IngresarNoticiaCubit>().actualizarImageEditar(lista);
      // image to base 64
    } catch (_) {
      //print('Fallo al seleccionar la imagen: $e');
    }
  }
}
