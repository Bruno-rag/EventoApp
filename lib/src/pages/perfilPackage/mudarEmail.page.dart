import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uesb_eventos/src/controllers/auth.service.dart';

class MudarEmail extends StatefulWidget {
  const MudarEmail({Key? key}) : super(key: key);

  @override
  State<MudarEmail> createState() => _MudarEmailState();
}

class _MudarEmailState extends State<MudarEmail> {

  late AuthService auth;

  final _formKeyEmail = GlobalKey<FormState>();
  final emailNovo = TextEditingController();



  trocarEmail() async {
    try{
      await context.read<AuthService>().trocarEmail(emailNovo.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Form(
        key: _formKeyEmail,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: emailNovo,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nome",
                    // border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Informe nome";
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text("Confirmar"),
                onPressed: () {
                  Navigator.of(context).pop();

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
