import 'package:flutter/material.dart';
import 'package:jumio_mobile_sdk_flutter/jumio_mobile_sdk_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jumio Test',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Liveness Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Jumio.init("AUTHORIZATION_TOKEN", "DATACENTER");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        child: const Text('Iniciar'),
        onPressed: () async {
          try {
            final result = await Jumio.start();
            debugPrint('result: $result');
          } catch (e) {
            debugPrint(e.toString());
          }
        },
      )),
    );
  }
}
