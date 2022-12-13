import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:noticias/cubit/noticias_cubit.dart';
import 'package:noticias/pages/MostrarUnaNoticia.dart';
import 'package:noticias/widgets/bottomNav.dart';
import 'package:noticias/widgets/categories.dart';
import 'package:noticias/widgets/listBar.dart';
import 'package:noticias/widgets/noticiaSeccion.dart';
import 'package:noticias/widgets/topNavInicial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoticiasListView extends StatefulWidget {
  static const routeName = '/noticias';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocProvider<NoticiasCubit>(
        create: (context) => NoticiasCubit()..fetchNoticias(),
        child: const NoticiasListView(),
      ),
    );
  }

  const NoticiasListView({Key? key}) : super(key: key);

  @override
  State<NoticiasListView> createState() => _NoticiasListViewState();
}

class _NoticiasListViewState extends State<NoticiasListView> {
  final noticiasLength = 5;
  bool isLoading = false;
  ScrollController scrollController = new ScrollController();
/*   late LinkedScrollControllerGroup verticalControllersGroup;
  late ScrollController scrollController1;
  late ScrollController scrollController2;

  @override
  void initState() {
    super.initState();
    verticalControllersGroup = LinkedScrollControllerGroup();
    scrollController1 = verticalControllersGroup.addAndGet();
    scrollController2 = verticalControllersGroup.addAndGet();

    scrollController1.addListener(() {
      print('uno: ' + scrollController1.position.pixels.toString());
      print('dos: ' + scrollController2.position.pixels.toString());
      if (scrollController1.position.pixels + 50 >=
          scrollController1.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    add5();

    setState(() {
      isLoading = false;
    });

    if (scrollController1.position.pixels + 100 <=
        scrollController1.position.maxScrollExtent) return;
    scrollController1.animateTo(scrollController1.position.pixels + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void add5() {} */

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              return Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (!isLoading &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        // start loading data
                        setState(() {
                          isLoading = true;
                        });
                        if (state.noticia!.next != null) {
                          context.read<NoticiasCubit>().fetchNoticias();
                          setState(() {
                            isLoading = false;
                          });
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                      // return true if the notification is consumed.
                      return true;
                    },
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<NoticiasCubit>().fetchNoticias();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        controller: scrollController,
                        child: Column(
                          children: [
                            const TopNav(),
                            const Categories(),
                            const ListBar(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.noticiaResult?.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return TextButton(
                                  onPressed: () {
                                    int? id = state.noticiaResult?[index].id;
                                    Navigator.of(context).pushNamed(
                                        MostrarUnaNoticia.routeName,
                                        arguments:
                                            MostrarUnaNoticiaArgs(id: id));
                                  },
                                  child: NoticiaSeccion(
                                    title:
                                        '${state.noticiaResult?[index].title}',
                                    body: '${state.noticiaResult?[index].body}',
                                    image:
                                        '${state.noticiaResult?[index].mainImage}',
                                    mes:
                                        '${state.noticiaResult?[index].createdAt!.month}',
                                    dia:
                                        '${state.noticiaResult?[index].createdAt!.day}',
                                    ano:
                                        '${state.noticiaResult?[index].createdAt!.year}',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isLoading)
                    Positioned(
                        bottom: 40,
                        left: size.width * 0.5 - 30,
                        child: LoadingIcon())
                ],
              );
          }
        },
      ),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
      child: const CircularProgressIndicator(),
    );
  }
}
