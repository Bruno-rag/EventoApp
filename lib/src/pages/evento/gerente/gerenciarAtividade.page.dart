import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/controllers/providerAtividade.controller.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/criarAtividade.page.dart';


import '../../../models/atividade.model.dart';



class GerenciarAtividadePage extends StatefulWidget {
  final String idEvento;
  const GerenciarAtividadePage({Key? key, required this.idEvento}) : super(key: key);

  @override
  State<GerenciarAtividadePage> createState() => _GerenciarAtividadePageState();
}

class _GerenciarAtividadePageState extends State<GerenciarAtividadePage> {
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
              "Gerência de Atividade",
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

            Divider(
              color: Colors.black,
              height: 40,

            ),

            //Botão criar evento

            Container(
              padding: EdgeInsets.only(
                top: 0,
                left: 10,
                right: 10,
              ),
              height: 60,
              alignment: Alignment.centerLeft,
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.black54
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Criar atividade",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                color: Colors.black87
                            ),
                          ),
                          Text(
                            "Cria uma nova atividade para o evento" ,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black54
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25,
                        color: Colors.black54
                    ),
                  ],
                ),
                onPressed: () {

                  Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => CriarAtividadePage(idEvento: widget.idEvento)));
                },
              ),
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
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(usuario.urlAvatar),
        // ),
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
        trailing:  IconButton(
            onPressed: () {
              pvdAtividade.deletaAtividade(atividade.idAtividade,"atividade", widget.idEvento);
            },
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            )
        ),

      ),
    );
  }
}
