import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/cubit/ingresar_noticia_cubit.dart';
import 'package:noticias/widgets/formularioAgregarNoticia/botonGuardar.dart';
import 'package:noticias/widgets/formularioAgregarNoticia/inputs.dart';
import 'package:noticias/widgets/formularioAgregarNoticia/textoPrincipal.dart';
import 'package:noticias/widgets/topNavPerfil.dart';
import 'package:image_picker/image_picker.dart';

ImagePicker picker = ImagePicker();

class FormularioAgregarNoticia extends StatefulWidget {
  static const String routeName = "/agregar";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return BlocProvider<IngresarNoticiaCubit>(
            create: (_) => IngresarNoticiaCubit(),
            child: FormularioAgregarNoticia(),
          );
        });
  }

  const FormularioAgregarNoticia({Key? key}) : super(key: key);

  @override
  _FormularioAgregarNoticiaState createState() =>
      _FormularioAgregarNoticiaState();
}

class _FormularioAgregarNoticiaState extends State<FormularioAgregarNoticia> {
  String? title;
  String? body;
  String? baseImage;
  File? _image;
  List<File>? _images = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<IngresarNoticiaCubit, IngresarNoticiaState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == IngresarNoticiasListStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Se ha ingresado la noticia con exito')),
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
            return Column(
              children: [
                const TopNavPerfil(),
                const TextoPrincipal(),
                inputs(),
                TextButton(
                  child: Text("Seleccione una foto desde la galeria"),
                  onPressed: () {
                    pickImage();
                  },
                ),
                Container(
                  child: _image == null
                      ? Text('No has seleccionado imagenes.')
                      : Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                        ),
                ),
                TextButton(
                  child: Text("Seleccione varias fotos desde la galeria"),
                  onPressed: () {
                    multiplePickImage();
                  },
                ),
                Container(
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
            );
        }
      },
    ));
  }

  Widget inputs() {
    return Inputs(
      title: ((value) {
        setState(() {
          title = value;
        });
      }),
      body: (value) {
        setState(() {
          body = value;
        });
      },
    );
  }

  Widget boton(IngresarNoticiaState state) {
    return BotonGuardar(title: title, body: body, imagen: baseImage);
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
      print(image64);
      setState(() => baseImage = image64);
    } on PlatformException catch (e) {
      print('Fallo al seleccionar la imagen: ${e}');
    }
  }

  Future multiplePickImage() async {
    final List<String> lista = [];
    try {
      var image = await picker.pickMultiImage();
      if (image != null) {
        setState(() {
          _images = image.map((e) => File(e.path)).toList();
        });
        for (int i = 0; i < image.length; i++) {
          final bytes = await image[i].readAsBytes();
          final image64 = base64Encode(bytes);
          lista.add(image64);
        }
        context.read<IngresarNoticiaCubit>().actualizarImages(lista);
      }
      // image to base 64
    } on PlatformException catch (e) {
      print('Fallo al seleccionar la imagen: ${e}');
    }
    ;
  }
}



  

/*Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                  
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {},
                    )
                  ],
                ),
              ));
        });
  }
}*/



