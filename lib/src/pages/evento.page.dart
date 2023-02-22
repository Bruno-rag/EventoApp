import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';
import 'package:uesb_eventos/src/pages/home.page.dart';

class EventoPage extends StatefulWidget {
  const EventoPage({Key? key}) : super(key: key);

  @override
  State<EventoPage> createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {

  final formKey = GlobalKey<FormState>();
  String nomeEvento = "";
  String inicioEvento = "";
  String terminoEvento = "";
  String detalheEvento = "";
  String atividadeEvento = "";

  Future createUser() async{
    final data = {
      "nomeEvento": nomeEvento,
      "inicioEvento": inicioEvento,
      "terminoEvento": terminoEvento,
      "urlAvatar" : "https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk=",
      "detalheEvento": detalheEvento,
      "atividaEvento": atividadeEvento,
    };
    final db = FirebaseFirestore.instance.collection("eventos").add(data).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
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
                        labelText: "Nome do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      ),
                      onChanged: (texto){
                        nomeEvento = texto;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Início do evento",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )
                      ),
                      onChanged: (texto){
                        inicioEvento = texto;
                      },
                    ),
                    TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Término do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      ),
                      onChanged: (texto){
                        terminoEvento = texto;
                      },
                    ),
                    TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Detalhe do evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      ),
                      onChanged: (texto){
                        detalheEvento = texto;
                      },
                    ),
                    TextFormField(
                      
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Atividades do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      ),
                      onChanged: (texto){
                        atividadeEvento = texto;
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
                          createUser();
                          Navigator.of(context).pop();
                          Navigator.of(context).push<int>(
                              MaterialPageRoute(builder: (_) => AppBarPage()));
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
