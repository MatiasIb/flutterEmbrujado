import 'package:flutter/material.dart';
import 'package:noticias/data/NoticiasRepository.dart';
import 'package:noticias/pages/welcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/config/themes.dart';
import 'package:noticias/routes/custom_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getApplicationTheme(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => NoticiasRepository(),
      child: MaterialApp(
        title: 'Noticias',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: Welcome.routeName,
      ),
    );
  }
}



/*  */