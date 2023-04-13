import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/usuario.model.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarEmail.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarFone.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarNome.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarSenha.page.dart';
import '../../controllers/auth.service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  late AuthService auth;

  final _formKeyEmail = GlobalKey<FormState>();
  final email = TextEditingController();
  final emailNovo = TextEditingController();
  final _formKeySenha = GlobalKey<FormState>();
  final senha = TextEditingController();
  final senhaNova = TextEditingController();
  final _formKeyNome = GlobalKey<FormState>();
  final nome = TextEditingController();
  final sobrenome = TextEditingController();


  logout() async {
    try {
      await context.read<AuthService>().logout();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future<Atividade?> readUser() async{

    final docUser = FirebaseFirestore.instance.collection("usuario/${auth.usuario!.uid}/info").doc("info");
    final snapshot = await docUser.get();

    if (snapshot.exists){
      return Atividade.lerFireBase(snapshot.data()!);
    }
  }

  trocarSenha() async {
    try{
      await context.read<AuthService>().trocarSenha(senhaNova.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  trocarEmail() async {
    try{
      await context.read<AuthService>().trocarEmail(emailNovo.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future mudarNome() async {
    try{
      final docUser = FirebaseFirestore.instance
          .collection("usuario/${auth.usuario!.uid}/info")
          .doc("info");
          docUser.update({
            'nome': nome.text,
            'sobrenome': sobrenome.text,
          });

    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perfil"
        ),
      ),
      body: ListView(
        children: [

          Column(
            children: [
              FutureBuilder<Atividade?>(
                future: readUser(),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    return Text("Error: ${snapshot.error}");
                  } else if(snapshot.hasData){
                    final user = snapshot.data!;
                    return user == null
                        ?Center(child: Text('Sem dados'),)
                        :buildUser(user);
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    logout();
                  },
                  child: Text(
                    "Sair da conta",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget buildUser(Atividade usuario) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(usuario.urlAvatar),
          maxRadius: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Meus dados" ,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        /*
        // Botão editar nome
        */
        Container(
          padding: EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.black54
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.black87
                          ),
                        ),
                        Text(
                          usuario.nome+" "+usuario.sobrenome ,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                ),
                Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.black54
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarNome()));
            },
          ),
        ),
        Divider(),

        //Botão email
        Container(
          padding: EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: Colors.black54
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black87
                        ),
                      ),
                      Text(
                        usuario.email ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.black54
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarEmail()));
            },
          ),
        ),

        Divider(),
        /*
        // Botão editar fone
        */
        Container(
          padding: EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Icon(
                    Icons.call,
                    size: 30,
                    color: Colors.black54
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Telefone",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black87
                        ),
                      ),
                      Text(
                        usuario.fone ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.black54
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarFone()));
            },
          ),
        ),
        Divider(),

        //Botão mudar senha
        Container(
          padding: EdgeInsets.only(
            top: 0,
            left: 10,
            right: 10,
          ),
          height: 60,
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Icon(
                    Icons.password,
                    size: 30,
                    color: Colors.black54
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Senha",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.black87
                        ),
                      ),
                      Text(
                        "##********" ,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.black54
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarSenha()));
            },
          ),
        ),

      ],
    );
  }
}
