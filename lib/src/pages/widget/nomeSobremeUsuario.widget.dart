import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/usuario.model.dart';
import '../../controllers/auth.service.dart';

class NomeSobrenomeUserWidget extends StatefulWidget {
  const NomeSobrenomeUserWidget({Key? key}) : super(key: key);

  @override
  State<NomeSobrenomeUserWidget> createState() => _NomeSobrenomeUserWidgetState();
}

class _NomeSobrenomeUserWidgetState extends State<NomeSobrenomeUserWidget> {

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
    return Center(
      child: FutureBuilder<Usuario?>(
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
  Widget buildUser(Usuario usuario) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(usuario.urlAvatar),
          maxRadius: 60,
        ),
        Text(
        usuario.nome + " " + usuario.sobrenome,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8,),
        Text(
          usuario.email,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );

  }
}
