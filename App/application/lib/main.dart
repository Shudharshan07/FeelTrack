import 'package:application/Mobile.dart';
import 'package:application/Windows.dart';
import 'package:application/about.dart';
import 'package:application/provide.dart';
import 'package:application/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var Box = await Hive.openBox('Theme');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Theme_Manager()),
      ChangeNotifierProvider(create: (context) => Graphs()),
    ],
    child: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: size.width < 400 ? Mobile() : Windows(),
      theme: Provider.of<Theme_Manager>(context).themeData,
      routes: {
        "/settings": (context) => Settings(),
        "/about": (context) => About(),
      },
    );
  }
}
