import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/models/evento.model.dart';

class MudarDetalheEvento extends StatefulWidget {
  final Atividade? evento;
  const MudarDetalheEvento({Key? key, this.evento}) : super(key: key);

  @override
  State<MudarDetalheEvento> createState() => _MudarDetalheEventoState();
}

class _MudarDetalheEventoState extends State<MudarDetalheEvento> {

  late AuthService auth;

  final _formKeyNome = GlobalKey<FormState>();
  final nome = TextEditingController();



  mudarNome() async {
    try{
      final docUser = FirebaseFirestore.instance
          .collection("eventos")
          .doc(widget.evento!.idEvento);
      docUser.update({
        'detalheEvento': nome.text,
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
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    labelText: "Detalhes de evento",
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

                  if(_formKeyNome.currentState!.validate()){
                    mudarNome();
                    Navigator.of(context).pop();

                  }


                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
