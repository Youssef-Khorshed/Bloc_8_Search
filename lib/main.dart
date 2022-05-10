// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/blocObserver.dart';
import 'package:flutter_application_1/bloc/products_bloc.dart';
import 'package:flutter_application_1/Shared/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/home.dart';

void main() {
  DioHelper.intial();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: prefer_const_literals_to_create_immutables
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc()..add(GetData()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
