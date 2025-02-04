import 'package:beripico/config/pages.dart';
import 'package:beripico/widgets/%20AdaptiveScaffold.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BeriPico",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          splashColor: Colors.transparent,
          useMaterial3: true,
        ),
        home: AdaptiveScaffold(appPages: appPages));
  }
}
