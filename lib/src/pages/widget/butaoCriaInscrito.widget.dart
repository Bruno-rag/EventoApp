import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/usuario.model.dart';
import '../../controllers/auth.service.dart';

class BotaoEnviaDadosUserWidget extends StatefulWidget {
  final String idEvento;
  final String collection;
  const BotaoEnviaDadosUserWidget(
      {Key? key,
        required this.idEvento,
        required this.collection,
      }) : super(key: key);

  @override
  State<BotaoEnviaDadosUserWidget> createState() => _BotaoEnviaDadosUserWidgetState();
}

class _BotaoEnviaDadosUserWidgetState extends State<BotaoEnviaDadosUserWidget> {

  late AuthService auth;
  late String idUsario = auth.usuario!.uid;

  Future<Atividade?> readUser() async{

    final docUser = FirebaseFirestore.instance.collection("usuario/${auth.usuario!.uid}/info").doc("info");
    final snapshot = await docUser.get();

    if (snapshot.exists){
      Atividade ex = Atividade.lerFireBase(snapshot.data()!);

      return Atividade.lerFireBase(snapshot.data()!);
    }
  }



  Future criarInscrito(String idEvento, String nome, String sobrenome, String fone, String urlAvatar, String dataNas, String email) async{

    final data = {
      "idUsuario": idUsario,
      "nome": nome,
      "sobrenome": sobrenome,
      "fone": fone,
      "urlAvatar" : urlAvatar,
      "dataNas": dataNas,
      "email": email,
    };
    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(widget.collection).doc(idUsario).set(data);
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Center(
      child: FutureBuilder<Atividade?>(
          future: readUser(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            } else if(snapshot.hasData){
              final user = snapshot.data!;
              return user == null
                  ?Center(child: Text('Sem dados'),)
                  :buildUser(user);
            }else{
              return Center(child: Text("Carregando ..."));
            }
          }
      ),
    );
  }
  Widget buildUser(Atividade usuario) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black87,
      child: TextButton(
        onPressed: (){
          criarInscrito( widget.idEvento, usuario.nome, usuario.sobrenome, usuario.fone, usuario.urlAvatar, usuario.dataNas, usuario.email);
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                    "Sua Inscrição está em análise"
                ),
              )
          );
        },
        child: Text(

          "Inscreva-se no evento",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
