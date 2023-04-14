import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/evento.model.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/pages/evento/inscrito/gerenciarEventoInscrito.page.dart';

import '../gerente/gerenciarEvento.page.dart';

class ListaEventosInscritosPage extends StatefulWidget {
  const ListaEventosInscritosPage({Key? key}) : super(key: key);

  @override
  State<ListaEventosInscritosPage> createState() => _ListaEventosInscritosPageState();
}

class _ListaEventosInscritosPageState extends State<ListaEventosInscritosPage> {
  late AuthService auth;
  late String idUser = auth.usuario!.uid;

  Stream<List<Atividade>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Atividade.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
          bottom: 80,
        ),
        child: Column(

          children: [
            Text(
              "Eventos Inscritos",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            Divider(
              color: Colors.black,
              height: 40,

            ),
            Expanded(
                child: StreamBuilder<List<Atividade>>(
                  stream: readUsers(),
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Text("Error: ${snapshot.error}");
                    } else if(snapshot.hasData){
                      final users = snapshot.data!;
                      return ListView(
                        children: users.map(buildUser).toList(),
                      );
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                )
            ),

          ],
        ),
      ),
    );
  }

  Widget buildUser(Atividade evento) {
    return (idUser == evento.idOrganizador)?Card(

      child: ListTile(
        onTap: () {
          Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => GerenciarEventoInscritoPage(evento: evento,)));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(evento.urlAvatar),
        ),
        title: Text(
          evento.nomeEvento,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          evento.inicioEvento,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,

          ),
        ),
        // trailing:  IconButton(
        //     onPressed: () {
        //       //removeItem(item);
        //     },
        //     icon: Icon(Icons.delete)
        // ),
      )
    ):
    SizedBox();
  }
}
