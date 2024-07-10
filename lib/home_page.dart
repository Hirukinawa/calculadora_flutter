import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Calculadora'),
        centerTitle: true,
        actions: const [Text('X')],
      ),
      drawer: const Drawer(),
      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
