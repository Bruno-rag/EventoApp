import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth.service.dart';

class CrachaVirtualPage extends StatefulWidget {

  const CrachaVirtualPage({
    Key? key,

  }) : super(key: key);

  @override
  State<CrachaVirtualPage> createState() => _CrachaVirtualPageState();
}

class _CrachaVirtualPageState extends State<CrachaVirtualPage> {
  late AuthService auth;
  late String idUsario = auth.usuario!.uid;

  /*
    Cria Informação do inscrito
   */

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
            "Crachá virtual"
        ),
        //estilo do appbar

      ),
      body: Container(
        //padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "NOME DO Evento AQUI",
              style: TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),
            ),

            //imagem do Usuário
            Container(
              height: 200,
              child: Image.network("https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk="),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 8,
            ),

            Text(
              "NOME DO USUARIO AQUI",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Função",
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
