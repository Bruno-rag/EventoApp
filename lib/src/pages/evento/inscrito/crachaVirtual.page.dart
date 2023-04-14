import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/usuario.model.dart';
import 'package:uesb_eventos/src/pages/widget/nomeSobremeUsuario.widget.dart';
import '../../../controllers/auth.service.dart';

class CrachaVirtualPage extends StatefulWidget {
  final String nome;
  const CrachaVirtualPage({
    Key? key, required this.nome

  }) : super(key: key);

  @override
  State<CrachaVirtualPage> createState() => _CrachaVirtualPageState();
}

class _CrachaVirtualPageState extends State<CrachaVirtualPage> {
  late AuthService auth;


  Future<Usuario?> readUser() async{

    final docUser = FirebaseFirestore.instance.collection("usuario/${auth.usuario!.uid}/info").doc("info");
    final snapshot = await docUser.get();

    if (snapshot.exists){
      return Usuario.lerFireBase(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Crachá virtual"
        ),
        //estilo do appbar

      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 40
        ),

        child: Container(
          padding: EdgeInsets.all(10),
          child: Card(
            shadowColor: Colors.black,
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                FutureBuilder<Usuario?>(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUser(Usuario usuario) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width*9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.nome,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 40,),
          CircleAvatar(
            backgroundImage: NetworkImage(usuario.urlAvatar),
            maxRadius: 100,
          ),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(

              children: [

                Text(
                  usuario.nome + " " + usuario.sobrenome,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 15,),
                Text(
                  usuario.email,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );

  }

}
