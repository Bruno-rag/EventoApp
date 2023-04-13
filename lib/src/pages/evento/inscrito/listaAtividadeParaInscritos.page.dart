import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/controllers/providerAtividade.controller.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/criarAtividade.page.dart';


import '../../../models/atividade.model.dart';



class ListaAtividadePage extends StatefulWidget {
  final String idEvento;
  const ListaAtividadePage({Key? key, required this.idEvento}) : super(key: key);

  @override
  State<ListaAtividadePage> createState() => _ListaAtividadePageState();
}

class _ListaAtividadePageState extends State<ListaAtividadePage> {
  late AuthService auth;
  late ProviderAtividade pvdAtividade;
  /*
    leitura do eventos
   */
  Stream<List<Atividade>> readAtividade() => FirebaseFirestore.instance
      .collection("eventos")
      .doc(widget.idEvento)
      .collection("atividade")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Atividade.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    pvdAtividade = Provider.of<ProviderAtividade>(context);

    return Scaffold(
      appBar:
      AppBar(),

      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 10,
          right: 10,
          bottom: 30,
        ),
        child: Column(
          children: [
            Text(
              "Lista de Atividades",
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
                  stream: readAtividade(),
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
                          "Sem Atividades",
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



  Widget buildUser(Atividade atividade) {
    return Card(
      child: ListTile(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => DescricaoHomologar(usuario: usuario)
          // ));
        },
        leading: Icon(
          Icons.add_task_rounded,
          color: Colors.black87,
        ),
        title: Text(
          atividade.nome ,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          atividade.data,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,

          ),
        ),
        // trailing:  IconButton(
        //     onPressed: () {
        //       pvdAtividade.deletaAtividade(atividade.idAtividade,"atividade", widget.idEvento);
        //     },
        //     icon: Icon(
        //       Icons.delete_forever,
        //       color: Colors.red,
        //     )
        // ),

      ),
    );
  }
}
