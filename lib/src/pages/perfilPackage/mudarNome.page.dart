import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';

class MudarNome extends StatefulWidget {
  const MudarNome({Key? key}) : super(key: key);

  @override
  State<MudarNome> createState() => _MudarNomeState();
}

class _MudarNomeState extends State<MudarNome> {

  late AuthService auth;

  final _formKeyNome = GlobalKey<FormState>();
  final nome = TextEditingController();
  final sobrenome = TextEditingController();


  mudarNome() async {
    try{
      final docUser = FirebaseFirestore.instance
          .collection("usuario/${auth.usuario!.uid}/info")
          .doc("info");
      docUser.update({
        'nome': nome.text,
        'sobrenome': sobrenome.text,

      });
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
        key: _formKeyNome,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: nome,
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
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: sobrenome,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Sobrenome",
                    //border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Informe O sobrenome";
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
                  mudarNome();

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
