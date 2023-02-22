import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/usuario.model.dart';
import 'package:uesb_eventos/src/pages/login.page.dart';
import '../services/auth.service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  late AuthService auth;

  logout() async {
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future<Usuario?> readUser() async{

    final docUser = FirebaseFirestore.instance.collection("usuario/${auth.usuario!.uid}/info").doc("info");
    final snapshot = await docUser.get();

    if (snapshot.exists){
      return Usuario.fromJson(snapshot.data()!);
    }
  }
  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil"
        ),
      ),
      body: Column(
        children: [

          Container(
            padding: EdgeInsets.all(20),
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
                  return Center(child: CircularProgressIndicator(),);
                }
              }
            ),
          ),
        ],
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


        SizedBox(
          height: 8,
        ),
        Text(
          "Olá! "+usuario.nome+" "+usuario.sobrenome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              logout();
            },
            child: Text(
              "Sair da conta",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
