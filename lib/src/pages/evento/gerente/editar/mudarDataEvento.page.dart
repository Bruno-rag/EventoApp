import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/models/eventos.model.dart';

class MudarDataEvento extends StatefulWidget {
  final Evento? evento;
  const MudarDataEvento({Key? key, this.evento}) : super(key: key);

  @override
  State<MudarDataEvento> createState() => _MudarDataEventoState();
}

class _MudarDataEventoState extends State<MudarDataEvento> {

  late AuthService auth;

  final _formKeyNome = GlobalKey<FormState>();
  final dataInicio = TextEditingController();
  final dataFim = TextEditingController();

  var mascaraDataInicio = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  mudarNome() async {
    try{
      final docUser = FirebaseFirestore.instance
          .collection("eventos")
          .doc(widget.evento!.idEvento);
      docUser.update({
        'inicioEvento': dataInicio.text,
        'terminoEvento': dataFim.text,
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
                inputFormatters: [mascaraDataInicio],
                controller: dataInicio,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Início do Evento",
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
                inputFormatters: [mascaraDataInicio],
                controller: dataFim,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Término do Evento",
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
