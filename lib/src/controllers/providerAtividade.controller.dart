
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProviderAtividade extends ChangeNotifier {



  // Future criarInscrito(String idUsuario, String collection, String idEvento, String nome, String sobrenome, String fone, String urlAvatar, String dataNas, String email) async{
  //
  //   final data = {
  //     "idUsuario": idUsuario,
  //     "nome": nome,
  //     "sobrenome": sobrenome,
  //     "fone": fone,
  //     "urlAvatar" : urlAvatar,
  //     "dataNas": dataNas,
  //     "email": email,
  //   };
  //   final dataUser = FirebaseFirestore.instance.collection("eventos").
  //   doc(idEvento).collection(collection).doc(idUsuario).set(data);
  // }

  Future deletaAtividade(String idAtividade, String collection, String idEvento) async{

    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(collection).doc(idAtividade).delete();
  }

}