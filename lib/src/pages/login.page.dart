
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/pages/home.page.dart';
import 'package:uesb_eventos/src/pages/recuperar.page.dart';

import '../services/auth.service.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final dataNas= TextEditingController();
  final fone= TextEditingController();

  late AuthService auth;

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Login';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }
  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);

    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
      createUser();
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future createUser() async{
    final db = FirebaseFirestore.instance.collection("usuario/${auth.usuario!.uid}/info").doc("info");
    final data = {
      "nome": nome.text,
      "sobrenome": sobrenome.text,
      "fone": fone.text,
      "urlAvatar" : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
      "fone": fone.text,
      "dataNas": dataNas.text,
    };
    db.set(data);
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      body: ListView(
        children: [
          isLogin == true ?
          Container(
            padding: EdgeInsets.only(
              top: 60,
            ),
            child: SizedBox(
              width: 200,
              height: 128,
              child: Image.asset("assets/logo1.png"),
            ),
          ) :SizedBox(

            height: 20,

          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5,
                      ),
                    ),
                    isLogin == false ?
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: TextFormField(
                            controller: nome,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o nome corretamente!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: TextFormField(
                            controller: sobrenome,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Sobrenome',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o sobrenome corretamente!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: TextFormField(
                            controller: fone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Telefone',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe o telefone corretamente!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: TextFormField(
                            controller: dataNas,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Data de nascimanto',
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Informe uma data válida!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ) :SizedBox(),
                    //email
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o email corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    //senha
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: TextFormField(
                        controller: senha,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informa sua senha!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (isLogin) {
                              login();
                            } else {
                              registrar();
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: (loading)
                              ? [
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ]
                              : [
                            const Icon(Icons.check),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                actionButton,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => setFormAction(!isLogin),
                      child: Text(toggleButton),
                    ),

                    isLogin == true ?
                    Column(
                      children: [
                        Container(

                          child: TextButton(
                            onPressed: (){
                              auth.visitante = true;
                              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => RecuperarPage()));
                            },
                            child: Text("Esqueceu a senha?"),
                          ),
                        ),
                        Container(

                          child: TextButton(
                            onPressed: (){
                              auth.visitante = true;
                              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => HomePage()));
                            },
                            child: Text("Entrar como visitante"),
                          ),
                        ),
                      ],
                    ) :SizedBox(

                      height: 20,

                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}