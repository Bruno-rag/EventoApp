import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';

class MudarSenha extends StatefulWidget {
  const MudarSenha({Key? key}) : super(key: key);

  @override
  State<MudarSenha> createState() => _MudarSenhaState();

}

class _MudarSenhaState extends State<MudarSenha> {

  late AuthService auth;

  final _formKeySenha = GlobalKey<FormState>();
  final senha = TextEditingController();
  final senhaNova = TextEditingController();

  trocarSenha() async {
    try{
      await context.read<AuthService>().trocarSenha(senhaNova.text);
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
        key: _formKeySenha,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: senha,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Senha Atual",
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
                controller: senhaNova,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Nova senha",
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
                  trocarSenha();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
