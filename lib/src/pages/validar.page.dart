import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';

class ValidarPage extends StatefulWidget {
  const ValidarPage({Key? key}) : super(key: key);

  @override
  State<ValidarPage> createState() => _ValidarPageState();
}

class _ValidarPageState extends State<ValidarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
            top: 40,
            left: 15,
            right: 15,
            bottom: 80,
          ),
          children: <Widget>[
            //Logo aqui
            Text("Validar Certificado",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Divider(
              color: Colors.black,
              height: 40,

            ),
            SizedBox(
              height: 40,
            ),
            /*Text("E-mail",
              textAlign: TextAlign.left,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),*/

            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Código do Evento",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
              ),
            ),

            SizedBox(
              height: 80,
            ),

            Container(
              alignment: Alignment.center,
              color: Colors.black87,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_)=> AppBarPage())
                  );
                },
                child: Text(
                  "Validar",
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
