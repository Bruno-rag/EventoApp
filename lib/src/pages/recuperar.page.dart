
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';
import 'package:uesb_eventos/src/pages/auth.check.dart';
import 'package:uesb_eventos/src/pages/login.page.dart';
import '../controllers/auth.service.dart';

class RecuperarPage extends StatefulWidget {
  const RecuperarPage({super.key});

  @override
  State<RecuperarPage> createState() => _RecuperarPageState();
}

class _RecuperarPageState extends State<RecuperarPage> {


  bool boxValue = false;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  registrar() async {
    //setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      //setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      body: Container(


        child: ListView(
          padding: EdgeInsets.only(
            top: 120,
            left: 40,
            right: 40,
            bottom: 80,
          ),
          children: <Widget>[
            //Logo aqui
            Text("Recuperar Senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: Column(
                  children:[
                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Informe um Email";
                        }
                        return null;
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )
                      ),
                    ),
                    //checkbox
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,

                      child: ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            registrar();


                            Navigator.of(context).push<int>(MaterialPageRoute(builder: (_)=> AuthCheck()));
                          }

                        },
                        child: Text(
                          "Confimar",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]
              ),
            ),

            Container(
              alignment: Alignment.center,

              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_)=> AuthCheck())
                  );
                },
                child: Text(
                  "Voltar",
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
