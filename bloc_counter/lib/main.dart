import 'dart:developer';

import 'package:bloc_counter/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text('$count');
              },
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(CounterDecrementPressed());
                },
                child: const Text('Decrement'),
              ),
              ElevatedButton(
                onPressed: () {
                  counterBloc.add(CounterIncrementPressed());
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
