import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskcat2/cubit/cubit.dart';
import 'package:taskcat2/screen/ui_screeen.dart';
import 'package:taskcat2/ticker.dart';

import 'bloc abserver.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TimerBloc>(
          create: (BuildContext context) =>TimerBloc( ticker: Ticker()),
          child: FirstPage()),
    );
  }
}

