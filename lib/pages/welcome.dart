import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/cubit/noticias_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/pages/pages.dart';
import 'package:noticias/widgets/widgets.dart';

class NoticiasListView extends StatefulWidget {
  static const routeName = '/noticias';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<NoticiasCubit>(
        create: (_) => NoticiasCubit()..fetchNoticias(),
        child: const NoticiasListView(),
      ),
    );
  }

  const NoticiasListView({Key? key}) : super(key: key);

  @override
  State<NoticiasListView> createState() => _NoticiasListViewState();
}

class _NoticiasListViewState extends State<NoticiasListView> {
  ScrollController scrollController = ScrollController();

  _scrollListener(){
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print("scroll bottom");
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      print("scroll top");
    }
  }

  @override
  void initState(){
    super.initState();
    scrollController.addListener(_scrollListener);
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus(),
      },
      child: BlocConsumer<NoticiasCubit, NoticiasState>(
        listener: (context, state) {
          if (state.status == NoticiasListStatus.success) {
          } else if (state.status == NoticiasListStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.exception}')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.bars,
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.bookmark,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: (state.status) != NoticiasListStatus.initial
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      children: [
                        const Categories(),
                        const ListBar(),
                        _resultsList(context, state),
                      ],
                    ),
                  )
                : Center(child: _loadingIcon()),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              elevation: 20,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {},
              child: const FaIcon(FontAwesomeIcons.locationDot),
            ),
            bottomNavigationBar: const BottomNav(),
          );
        },
      ),
    );
  }

  Widget _loadingIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(),
    );
  }

  Widget _resultsList(BuildContext context, NoticiasState state) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.noticiaResult?.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.white,
          onTap: () {
            int? id = state.noticiaResult?[index].id;
            Navigator.of(context).pushNamed(MostrarUnaNoticia.routeName,
                arguments: MostrarUnaNoticiaArgs(id: id));
          },
          child: NoticiaSeccion(
            title: '${state.noticiaResult?[index].title}',
            body: '${state.noticiaResult?[index].body}',
            image: '${state.noticiaResult?[index].mainImage}',
            mes: '${state.noticiaResult?[index].createdAt!.month}',
            dia: '${state.noticiaResult?[index].createdAt!.day}',
            ano: '${state.noticiaResult?[index].createdAt!.year}',
          ),
        );
      },
    );
  }
}
