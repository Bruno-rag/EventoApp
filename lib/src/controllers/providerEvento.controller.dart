
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProviderEvento extends ChangeNotifier {

  Future criarEvento() async{
    final dataEvento = FirebaseFirestore.instance.collection("teste").doc();
    final data = {
      "idEvento": dataEvento.id,
      "nomeEvento": dataEvento.runtimeType.toString(),
      "inicioEvento": dataEvento.hashCode.toString(),
      "terminoEvento": dataEvento.hashCode.toString(),
      "urlAvatar" : "https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk=",
      "detalheEvento": dataEvento.hashCode.toString(),
      "atividaEvento": dataEvento.hashCode.toString(),
      "idOrganizador": dataEvento.hashCode.toString(),
    };
    dataEvento.set(data).
    onError((e, _) => print("Error writing document: $e"));
  }

  Future criarInscrito(String idUsuario, String collection, String idEvento, String nome, String sobrenome, String fone, String urlAvatar, String dataNas, String email) async{

    final data = {
      "idUsuario": idUsuario,
      "nome": nome,
      "sobrenome": sobrenome,
      "fone": fone,
      "urlAvatar" : urlAvatar,
      "dataNas": dataNas,
      "email": email,
    };
    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(collection).doc(idUsuario).set(data);
  }

  Future deletaInscrito(String idUsuario, String collection, String idEvento) async{

    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(collection).doc(idUsuario).delete();
  }

}