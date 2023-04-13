import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';


import '../../models/usuario.model.dart';




class TesteWidget extends StatefulWidget {
  const TesteWidget({Key? key}) : super(key: key);

  @override
  State<TesteWidget> createState() => _TesteWidgetState();
}

class _TesteWidgetState extends State<TesteWidget> {
  late AuthService auth;

  //  late final inscritos = FirebaseFirestore.instance.collection("eventos")
  //      .doc("4eGInWR30DBdL0FA0KOS")
  //      .collection("inscritos")
  //      .withConverter(
  //      fromFirestore: Evento.fromFirestore,
  //      toFirestore: (Evento evento, _) => evento.toFirestore()
  //     );
  //
  // final ref = FirebaseFirestore.instance.collection("eventos").withConverter<Evento>(
  //   fromFirestore: Evento.fromFirestore,
  //   toFirestore: (evento, _) => evento.toFirestore(),
  // );
  //
  // final usersQuery = FirebaseFirestore.instance.collection('eventos');

  /*
    leitura de sudcoleção
   */
  Stream<List<Usuario>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .doc("4eGInWR30DBdL0FA0KOS")
      .collection("inscritos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Usuario.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Container(
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
                child: StreamBuilder<List<Usuario>>(
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

            // Expanded(
            //   child: FirebaseDatabaseListView(
            //     query: usersQuery,
            //     itemBuilder: (context, snapshot) {
            //       Map<String, dynamic> user = snapshot.value as Map<String, dynamic>;
            //
            //       return Text('User name is ${user['name']}');
            //     },
            //   ),
            // ),



          ],
        ),
      );

  }

  Widget buildUser(Usuario usuario) {
    return Column(
      children: [
        Card(
          shadowColor: Colors.black,
          elevation: 7,

          child: ListTile(

            onTap: () {

            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(usuario.urlAvatar),
            ),
            title: Text(
              usuario.nome,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              " Data de início: " + usuario.email,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,

              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),

            // trailing:  IconButton(
            //     onPressed: () {
            //       //removeItem(item);
            //     },
            //     icon: Icon(Icons.delete)
            // ),

          ),

        ),
        SizedBox(height: 8,)
      ],
    );
  }

}
