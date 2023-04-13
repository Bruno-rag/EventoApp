import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth.service.dart';

class MudarFone extends StatefulWidget {
  const MudarFone({Key? key}) : super(key: key);

  @override
  State<MudarFone> createState() => _MudarFoneState();
}

class _MudarFoneState extends State<MudarFone> {

  late AuthService auth;

  final _formKeyFone = GlobalKey<FormState>();
  final fone = TextEditingController();

  mudarFone() async {
    try{
      final docUser = FirebaseFirestore.instance
          .collection("usuario/${auth.usuario!.uid}/info")
          .doc("info");
      docUser.update({
        'fone': fone.text,
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
        key: _formKeyFone,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: fone,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Telefone",
                    // border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Informe o número do seu telefone";
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
                  mudarFone();

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
