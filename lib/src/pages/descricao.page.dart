import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/eventos.model.dart';
import 'package:uesb_eventos/src/pages/widget/butaoEnviaDadosHomologado.widget.dart';
import '../controllers/auth.service.dart';

class DescricaoPage extends StatefulWidget {
  final Evento? evento;
  const DescricaoPage({
    Key? key, this.evento,
  }) : super(key: key);

  @override
  State<DescricaoPage> createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {
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
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //imagem hamburger
            Container(

              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.evento!.urlAvatar),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Nome do evento: "+widget.evento!.nomeEvento,
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
              "Início: "+widget.evento!.inicioEvento,
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
              "Término: "+ widget.evento!.terminoEvento,
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
              "Descrição do evento: "+widget.evento!.detalheEvento,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(
              height: 8,
            ),

            BotaoEnviaDadosHomologadoWidget(idEvento: widget.evento!.idEvento, collection: "homologados"),
            // Container(
            //   alignment: Alignment.center,
            //
            //   child: ElevatedButton(
            //     onPressed: (){
            //       criarInscrito(widget.evento!.idEvento);
            //       Navigator.of(context).pop();
            //       //testeInscrito();
            //       Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => EventosInscritos()));
            //     },
            //     child: Text(
            //       "Inscrever",
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
