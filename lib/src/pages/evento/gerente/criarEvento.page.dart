import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarEventoPage extends StatefulWidget {
  const CriarEventoPage({Key? key}) : super(key: key);

  @override
  State<CriarEventoPage> createState() => _CriarEventoPageState();
}

class _CriarEventoPageState extends State<CriarEventoPage> {

  late AuthService auth;
  late String idOrganizador = auth.usuario!.uid;

  final formKey = GlobalKey<FormState>();
  final nomeEvento = TextEditingController() ;
  final inicioEvento = TextEditingController() ;
  final terminoEvento = TextEditingController() ;
  final detalheEvento = TextEditingController() ;
  final atividadeEvento = TextEditingController() ;
  var mascaraDataInicio = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Future criarEvento() async{

    final dataEvento = FirebaseFirestore.instance.collection("eventos").doc();

    final data = {
      "idEvento": dataEvento.id,
      "nomeEvento": nomeEvento.text,
      "inicioEvento": inicioEvento.text,
      "terminoEvento": terminoEvento.text,
      "urlAvatar" : "https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk=",
      "detalheEvento": detalheEvento.text,
      "idOrganizador": idOrganizador,

    };

    dataEvento.set(data).
    onError((e, _) => print("Error writing document: $e"));
  }


  /*Future createUser() async{

    final db = FirebaseFirestore.instance.collection('/eventos').add(json);

    final json = {
      "id": nomeEvento,
      'nome': nomeEvento,
      'preco': nomeEvento,
      'url': nomeEvento,
      'descricao': nomeEvento,
      'quatidade': nomeEvento,
    };
    await db.set(json);
  }*/

  @override
  Widget build(BuildContext context) {

    auth = Provider.of<AuthService>(context);

    return Scaffold(
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
              "Cadastrar Evento",
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
            /*Text("E-mail",
              textAlign: TextAlign.left,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),*/
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_contact_cal_outlined),
                        labelText: "Nome do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      nomeEvento.text = texto;
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
                        icon: Icon(Icons.calendar_today),
                        labelText: "Início do evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      inicioEvento.text = texto;
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
                        labelText: "Término do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      terminoEvento.text = texto;
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
                          criarEvento();
                          Navigator.of(context).pop();
                          Navigator.of(context).push<int>(
                              MaterialPageRoute(builder: (_) => AppBarPage()));
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
