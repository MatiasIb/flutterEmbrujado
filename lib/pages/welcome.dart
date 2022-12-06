import 'package:flutter/material.dart';
import 'package:noticias/cubit/noticias_cubit.dart';
import 'package:noticias/data/NoticiasRepository.dart';
import 'package:noticias/pages/MostrarUnaNoticia.dart';
import 'package:noticias/widgets/bottomNav.dart';
import 'package:noticias/widgets/categories.dart';
import 'package:noticias/widgets/listBar.dart';
import 'package:noticias/widgets/noticiaCard.dart';
import 'package:noticias/widgets/noticiaSeccion.dart';
import 'package:noticias/widgets/topNavInicial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Welcome extends StatelessWidget {
  static const String routeName = "/welcome";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const Welcome());
  }

  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoticiasCubit()..fetchNoticias(),
      child: const NoticiasListView(),
    );
  }
}

class NoticiasListView extends StatelessWidget {
  const NoticiasListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        onPressed: () {},
        child: FaIcon(FontAwesomeIcons.locationDot),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocConsumer<NoticiasCubit, NoticiasState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.status == NoticiasListStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Se han cargado las noticias con exito')),
            );
          } else if (state.status == NoticiasListStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.exception}')),
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TopNav(),
                    Categories(),
                    ListBar(),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.noticia?.length,
                      itemBuilder: (context, index) => TextButton(
                        onPressed: () {
                          int? id = state.noticia?[index].id;
                          Navigator.of(context).pushNamed(
                              MostrarUnaNoticia.routeName,
                              arguments: MostrarUnaNoticiaArgs(id: id));
                        },
                        child: NoticiaSeccion(
                          title: '${state.noticia?[index].title}',
                          body: '${state.noticia?[index].body}',
                          image: '${state.noticia?[index].mainImage}',
                          mes: '${state.noticia?[index].createdAt.month}',
                          dia: '${state.noticia?[index].createdAt.day}',
                          ano: '${state.noticia?[index].createdAt.year}',
                        ),
                      ),
                    )
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

/* SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          TopNav(),
          Categories(),
          ListBar(),
          NoticiaSeccion(),
        ],
      ),
    );*/
