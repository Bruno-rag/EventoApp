import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/avaliacao.page.dart';
import 'package:uesb_eventos/src/pages/baixarCertificado.page.dart';
import 'package:uesb_eventos/src/pages/consultarFrequencia.dart';

class EventosParticipei extends StatelessWidget {
  const EventosParticipei({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Center(
              child: Text(
                'Meus Eventos',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //ICONE do histórico
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
                    "Nome:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Data de Termino: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
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
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nome:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Data de Termino: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
              )
            ],
          ),

        ],
      ),
    );
  }
}
