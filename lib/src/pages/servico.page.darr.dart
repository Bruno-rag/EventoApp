import 'package:flutter/material.dart';

class ServicoPage extends StatefulWidget {
  const ServicoPage({Key? key}) : super(key: key);

  @override
  State<ServicoPage> createState() => _ServicoPageState();
}

class _ServicoPageState extends State<ServicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Serviço page"),
      ),
    );
  }
}
