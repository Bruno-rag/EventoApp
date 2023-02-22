import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/models/eventos.model.dart';


class DescricaoPage extends StatefulWidget {
  final Eventos? evento;
  const DescricaoPage({
    Key? key, this.evento,

  }) : super(key: key);

  @override
  State<DescricaoPage> createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {



  @override
  Widget build(BuildContext context) {


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
            Divider(),
            SizedBox(
              height: 8,
            ),
            Text(
              "Atividades do evento: "+widget.evento!.atividaEvento,
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.center,

              child: ElevatedButton(
                onPressed: (){

                },
                child: Text(
                  "Inscrever",
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
