import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarAtividadePage extends StatefulWidget {
  final String idEvento;
  const CriarAtividadePage({Key? key, required this.idEvento}) : super(key: key);

  @override
  State<CriarAtividadePage> createState() => _CriarAtividadePageState();
}

class _CriarAtividadePageState extends State<CriarAtividadePage> {

  late AuthService auth;
  late String idOrganizador = auth.usuario!.uid;

  final formKey = GlobalKey<FormState>();
  final nomeAtividade = TextEditingController() ;
  final atividadeData = TextEditingController() ;
  final detalheEvento = TextEditingController() ;

  var mascaraDataInicio = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Future criarAtividade() async{

    final dataAtividade = FirebaseFirestore.instance
      .collection("eventos")
      .doc(widget.idEvento)
      .collection("atividade")
      .doc();

    final data = {
      "idAtividade": dataAtividade.id,
      "nome": nomeAtividade.text,
      "descricao": detalheEvento.text,
      "data": atividadeData.text,

    };
    dataAtividade.set(data).
    onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {

    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
            top: 40,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          children: <Widget>[
            //Logo aqui
            Text(
              "Cadastrar Atividade",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Divider(
              color: Colors.black,
              height: 40,
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_contact_cal_outlined),
                        labelText: "Nome da Atividade",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      nomeAtividade.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    inputFormatters: [mascaraDataInicio],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.event),
                        labelText: "Data da atividade",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      atividadeData.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                        icon: Icon(Icons.article_outlined),
                        labelText: "Detalhe do evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      detalheEvento.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.black87,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          criarAtividade();
                          Navigator.of(context).pop();
                        }

                      },
                      child: Text(
                        "Criar eventos",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
