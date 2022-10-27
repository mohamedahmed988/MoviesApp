
import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services.dart';
import 'package:movies_app/movies/Presentation/Screens/movies_screen.dart';

void main()
{
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor:   Colors.grey.shade900,
      ),
      home: const MainMoviesScreen(),
    );
  }
}