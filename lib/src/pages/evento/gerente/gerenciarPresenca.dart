import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/descricaoHomologar.dart';

import '../../../models/usuario.model.dart';

class GerenciarPresenca extends StatefulWidget {
  final String idEvento;
  const GerenciarPresenca({Key? key, required this.idEvento}) : super(key: key);

  @override
  State<GerenciarPresenca> createState() => _GerenciarPresencaState();
}

class _GerenciarPresencaState extends State<GerenciarPresenca> {
  late AuthService auth;

  /*
    leitura do eventos
   */
  Stream<List<Usuario>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .doc(widget.idEvento)
      .collection("inscritos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Usuario.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar:
      AppBar(),

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
              "Inscritos",
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
                    } if(snapshot.hasData == false){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
                      final users = snapshot.data!;
                      return ListView(
                        children: users.map(buildUser).toList(),
                      );
                    }else if(snapshot.data!.isEmpty){

                      return Container(
                        padding: EdgeInsets.only(top: 100),
                        child: Text(
                          "Sem inscritos",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
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



  Widget buildUser(Usuario usuario) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DescricaoHomologar(usuario: usuario)
          ));
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
          usuario.email,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold
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
