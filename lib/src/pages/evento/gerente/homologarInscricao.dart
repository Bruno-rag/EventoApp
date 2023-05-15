import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/controllers/providerEvento.controller.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/descricaoHomologar.dart';
import '../../../models/usuario.model.dart';
import '../../widget/butaoEnviaDadosHomologado.widget.dart';

class HomologarInscricao extends StatefulWidget {
  final String idEvento;
  const HomologarInscricao({Key? key, required this.idEvento}) : super(key: key);

  @override
  State<HomologarInscricao> createState() => _HomologarInscricaoState();
}

class _HomologarInscricaoState extends State<HomologarInscricao> {
  late AuthService auth;
  late ProviderEvento pvdEvento;
  /*
    leitura do eventos
   */
  Stream<List<Usuario>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .doc(widget.idEvento)
      .collection("homologados")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Usuario.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    pvdEvento = Provider.of<ProviderEvento>(context);

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
              "Homologar inscrição",
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
                          "Sem Homologados",
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
          usuario.nome + " " + usuario.sobrenome,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          usuario.email,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,

          ),
        ),
        trailing:  Container(
          width: 100,
          child: Row(
            children: <Widget>[
              /*

              //confimar inscrição

               */
              IconButton(
                  onPressed: () {

                    pvdEvento.criarInscrito( usuario.idUsuario , "inscritos", widget.idEvento, usuario.nome, usuario.sobrenome, usuario.fone, usuario.urlAvatar, usuario.dataNas, usuario.email);
                    pvdEvento.deletaInscrito(usuario.idUsuario,"homologados", widget.idEvento);
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
              ),
              /*

              //cancelar inscrição

               */
              IconButton(
                  onPressed: () {
                    pvdEvento.deletaInscrito(usuario.idUsuario,"homologados", widget.idEvento);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
