
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/usuario.model.dart';

class DescricaoHomologar extends StatefulWidget {
  final Usuario? usuario;
  const DescricaoHomologar({
    Key? key, this.usuario,

  }) : super(key: key);

  @override
  State<DescricaoHomologar> createState() => _DescricaoHomologarState();
}

class _DescricaoHomologarState extends State<DescricaoHomologar> {

  Future criarUser() async{

    final dataUser = FirebaseFirestore.instance.collection("inscritos").doc();


    final data = {
      "idUsuario": widget.usuario!.nome,
      "nome": widget.usuario!.nome,
      "sobrenome": widget.usuario!.nome,
      "fone": widget.usuario!.nome,
      "urlAvatar" : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      "fone": widget.usuario!.nome,
      "dataNas": widget.usuario!.nome,
      "email": widget.usuario!.nome,
    };

    dataUser.set(data).
    onError((e, _) => print("Error writing document: $e"));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Descrição"
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //imagem hamburger
            Container(

              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.usuario!.urlAvatar),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Nome : " + widget.usuario!.nome + " " + widget.usuario!.sobrenome,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            Text(
              "Email: "+widget.usuario!.email,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            Text(
              "Telefone: "+ widget.usuario!.fone,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            Text(
              "Data de nascimento: "+widget.usuario!.dataNas,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),

            SizedBox(
              height: 8,
            ),

            // Container(
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     onPressed: (){
            //       Navigator.of(context).pop();
            //       criarUser();
            //     },
            //     child: Text(
            //       "Aceitar",
            //       style: TextStyle(
            //         fontSize: 15,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.center,
            //   child: ElevatedButton(
            //     onPressed: (){
            //     },
            //     child: Text(
            //       "Recusar",
            //       style: TextStyle(
            //         fontSize: 15,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

}
