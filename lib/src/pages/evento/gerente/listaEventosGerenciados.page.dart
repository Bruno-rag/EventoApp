import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/evento.model.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';

import 'gerenciarEvento.page.dart';

class ListaEventosGerenciadosPage extends StatefulWidget {
  const ListaEventosGerenciadosPage({Key? key}) : super(key: key);

  @override
  State<ListaEventosGerenciadosPage> createState() => _ListaEventosGerenciadosPageState();
}

class _ListaEventosGerenciadosPageState extends State<ListaEventosGerenciadosPage> {
  late AuthService auth;
  late String idUser = auth.usuario!.uid;

  Stream<List<Evento>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Evento.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
          bottom: 80,
        ),
        child: Column(
          children: [
            const Text(
              "Eventos Gerenciados",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

           const Divider(
              color: Colors.black,
              height: 40,

            ),
            Expanded(
                child: StreamBuilder<List<Evento>>(
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
            ),

          ],
        ),
      ),
    );
  }

  Widget buildUser(Evento evento) {
    return (idUser == evento.idOrganizador)?Card(

      child: ListTile(
        onTap: () {
          Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => GerenciarEventoPage(evento: evento,)));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(evento.urlAvatar),
        ),
        title: Text(
          evento.nomeEvento,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          evento.inicioEvento,
          style: const TextStyle(
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
    const SizedBox();
  }
}
