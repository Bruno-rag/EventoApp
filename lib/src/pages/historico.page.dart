import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/pages/avaliacao.page.dart';
import 'package:uesb_eventos/src/pages/baixarCertificado.page.dart';
import '../controllers/auth.service.dart';
import '../models/evento.model.dart';
import 'consultarFrequencia.dart';
import 'descricao.page.dart';
class EventosParticipei extends StatefulWidget {
  const EventosParticipei({Key? key}) : super(key: key);
  @override
  State<EventosParticipei> createState() => _EventosParticipei();
}
class _EventosParticipei extends State<EventosParticipei>{

  late AuthService auth;
  Stream<List<Evento>> readUsers() => FirebaseFirestore.instance
      .collection("eventos")
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc)=> Evento.lerFireBase(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Scaffold(
        appBar:
        auth.visitante == true ? AppBar(
          actions: [
            TextButton(

              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).push<int>(MaterialPageRoute(
                //   builder: (_) => CarrinhoPage(),
                // ),);
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ) : null,

        body: Container(
          padding: EdgeInsets.only(
            top: 40,
            left: 10,
            right: 10,

          ),
          child: Column(

            children: [
              Text(
                "Histórico",
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
                  child: StreamBuilder<List<Evento>>(
                    stream: readUsers(),
                    builder: (context, snapshot){
                      if(snapshot.hasError){
                        return Text("Error: ${snapshot.error}");
                      } else if(snapshot.hasData){
                        final users = snapshot.data!;
                        return ListView(
                          children: users.map(buildUser).toList(),
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
      )



    );
  }

  Widget buildUser(Evento evento) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 12,
                    left: 20,
                    right: 20,
                  ),
                  //color: Colors.amber,
                  height: 210,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                        image: NetworkImage("https://media.istockphoto.com/id/974238866/pt/foto/audience-listens-to-the-lecturer-at-the-conference.jpg?s=612x612&w=0&k=20&c=ZOCjHsr2nyWVvAgjA36Kg1FaIQpvQ3oThxEf_W7JdCc="),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.24),
                          BlendMode.darken,
                        )
                    ),

                  ),
                  //descrição
                ),

              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome: " + evento.nomeEvento,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox( height: 5,),
                Text(
                  "Data de Termino: " + evento.terminoEvento,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(

                    onPressed: (){
                      Navigator.of(context).push<int>(
                          MaterialPageRoute(builder: (_) => ConsultarFrequencia()));
                    },
                    child: Text("Consultar frequência"),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push<int>(
                        MaterialPageRoute(builder: (_) => BaixarCertificado()));
                  },
                  child: Text("Baixar Certificado"),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push<int>(
                        MaterialPageRoute(builder: (_) => AvaliacaoPage()));
                  },
                  child: Text("Avaliar Evento"),
                ),
              ],
            ),
            SizedBox(
              height: 100 ,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
