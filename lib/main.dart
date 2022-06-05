import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unit_test/adder.dart';

import 'bloc/add_bloc.dart';

void main() {
  GetIt.I.registerLazySingleton<AdderInterface>(() => Adder());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AddBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: BlocBuilder<AddBloc, AddState>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.number.toString(),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: const ValueKey('add'),
            child: const Icon(Icons.add),
            onPressed: () {
              BlocProvider.of<AddBloc>(context).add(AddNumber());
            },
          ),
          FloatingActionButton(
            key: const ValueKey('sub'),
            child: const Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of<AddBloc>(context).add(SubtractNumber());
            },
          ),
        ],
      ),
    );
  }
}
