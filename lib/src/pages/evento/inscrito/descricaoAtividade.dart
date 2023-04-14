import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/auth.service.dart';
import '../../../models/atividade.model.dart';

class DescricaoAtividadePage extends StatefulWidget {
  final Atividade? atividade;
  const DescricaoAtividadePage({
    Key? key, this.atividade,
  }) : super(key: key);

  @override
  State<DescricaoAtividadePage> createState() => _DescricaoAtividadePageState();
}

class _DescricaoAtividadePageState extends State<DescricaoAtividadePage> {
  late AuthService auth;
  late String idUsario = auth.usuario!.uid;

  /*
    Cria Informação do inscrito

   */
  // Future criarInscrito(String idEvento) async{
  //
  //   final data = {
  //     "idUsuario": idUsario,
  //     "nome": "teste1",
  //     "sobrenome": "teste1",
  //     "fone": "teste1",
  //     "urlAvatar" : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
  //     "fone": "teste1",
  //     "dataNas": "teste1",
  //     "email": "teste1",
  //   };
  //   final dataUser = FirebaseFirestore.instance.collection("eventos").
  //   doc(idEvento).collection("homologados").doc(idUsario).set(data);
  // }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Descrição"
        ),
        //estilo do appbar

      ),
      body: Container(

        padding: EdgeInsets.all(20),
        child: ListView(

          children: [
            //imagem hamburger
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network("https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk="),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Nome da Atividade: "+widget.atividade!.nome,
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
              "Data: "+ widget.atividade!.data,
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
              "Descrição da atividade: "+widget.atividade!.descricao,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Container(
              alignment: Alignment.center,
              color: Colors.black87,
              child: TextButton(
                onPressed: (){

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                            "inscrição bem-sucedida"
                        ),
                      )
                  );
                },
                child: Text(

                  "Inscreva-se na atividade",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
