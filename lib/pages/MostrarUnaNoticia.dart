import 'package:flutter/material.dart';
import 'package:noticias/cubit/noticias_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/widgets/mostrarUnaNoticia/TopNavUnaNoticia.dart';
import 'package:noticias/widgets/mostrarUnaNoticia/alertDialog.dart';
import 'package:noticias/widgets/mostrarUnaNoticia/contenidoMostrarUnaNoticia.dart';

class MostrarUnaNoticiaArgs {
  final int? id;
  const MostrarUnaNoticiaArgs({this.id});
}

class MostrarUnaNoticia extends StatefulWidget {
  static const String routeName = "/detail";
  final int? id;

  static Route route({required MostrarUnaNoticiaArgs args}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return BlocProvider<NoticiasCubit>(
            create: (_) => NoticiasCubit()..traerUnaNoticia(args.id),
            child: const MostrarUnaNoticia(),
          );
        });
  }

  const MostrarUnaNoticia({Key? key, this.id}) : super(key: key);

  @override
  State<MostrarUnaNoticia> createState() => _MostrarUnaNoticiaState();
}

class _MostrarUnaNoticiaState extends State<MostrarUnaNoticia> {
  @override
  _MostrarUnaNoticiaState createState() => _MostrarUnaNoticiaState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NoticiasCubit, NoticiasState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == NoticiasListStatus.success) {
          } else if (state.status == NoticiasListStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error del servidor.')),
            );
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case NoticiasListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Column(
                children: [
                  TopNavUnaNoticia(
                    id: state.noticiaDetail?.id,
                    noticia: state.noticiaDetail,
                  ),
                  Expanded(
                    child: ListView(children: [
                      ContenidoMostrarUnaNoticia(
                        mainImage: state.noticiaDetail?.mainImage,
                        title: state.noticiaDetail?.title,
                        body: state.noticiaDetail?.body,
                        images: state.noticiaDetail?.images,
                      )
                    ]),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}


/* Column(children: [
                      Text('${state.noticiaDetail?.title}'),
                      Text('${state.noticiaDetail?.body}'),
                      ...state.noticiaDetail!.images.map((item) {
                        return Text('${item.image}');
                      }),
                    ]), */