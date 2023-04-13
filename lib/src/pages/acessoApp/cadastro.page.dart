
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/pages/appbar.page.dart';
import 'package:uesb_eventos/src/pages/auth.check.dart';
import 'package:uesb_eventos/src/pages/acessoApp/login.page.dart';
import '../../controllers/auth.service.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {


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
        color: Color.fromARGB(255, 243, 204, 217),

        child: ListView(
          padding: EdgeInsets.only(
            top: 40,
            left: 40,
            right: 40,
            bottom: 80,
          ),
          children: <Widget>[
            //Logo aqui
            Text("Cadastro",
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Informe o nome";
                    }
                    return null;
                  },
                ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe o sobrenome";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Sobrenome",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe uma data";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        labelText: "Data de Nascimento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe um telefone";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                  ),
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
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Informe uma senha";
                      }
                      return null;
                    },
                    controller: senha,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                  ),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Senha não confere";
                      }
                      return null;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: " Confirmar Senha",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //checkbox
                  Row(
                    children: [
                      Checkbox(
                          value: boxValue,
                          onChanged: (bool ? value){
                          }
                      ),
                      Text("Hum ... "),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: boxValue,
                          onChanged: (bool ? value){
                          }
                      ),
                      Text("Hum ... "),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: boxValue,
                          onChanged: (bool ? value){
                          }
                      ),
                      Text("Hum ... "),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.black87,
                    child: TextButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          registrar();

                          Navigator.of(context).pop();
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
              color: Colors.black87,
              child: TextButton(
                onPressed: (){
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_)=> LoginPage())
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
