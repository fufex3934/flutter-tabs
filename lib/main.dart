import 'package:flutter/material.dart';
import 'package:tabs/firstPage.dart';
import 'package:tabs/secondPage.dart';

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
        primarySwatch: Colors.teal,
      ),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar'),
        backgroundColor: Colors.teal,
        bottom: TabBar(controller: _controller, tabs: const [
          Tab(
            icon: Icon(Icons.access_alarm),
          ),
          Tab(
            icon: Icon(Icons.access_time),
          )
        ]),
      ),
      body: TabBarView(
          controller: _controller, children: const [FirstPage(), SecondPage()]),
    );
  }
}
