import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/eventos.model.dart';
import 'package:uesb_eventos/src/pages/descricao.page.dart';
import 'package:uesb_eventos/src/services/auth.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AuthService auth;

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar:
      auth.visitante == true ? AppBar() : null,

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
              "Evento de Destaque",
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
                  child: StreamBuilder<List<Eventos>>(
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

  Stream<List<Eventos>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Eventos.fromJson(doc.data())).toList());

  Widget buildUser(Eventos evento) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DescricaoPage(evento: evento)
          ));
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
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,

          ),
        ),
        // trailing:  IconButton(
        //     onPressed: () {
        //       //removeItem(item);
        //     },
        //     icon: Icon(Icons.delete)
        // ),
      ),
    );
  }
}
