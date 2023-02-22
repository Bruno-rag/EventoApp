import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/evento.page.dart';
import 'package:uesb_eventos/src/pages/historico.page.dart';
import 'package:uesb_eventos/src/pages/gerenciarPresenca.dart';
import 'package:uesb_eventos/src/pages/home.page.dart';
import 'package:uesb_eventos/src/pages/homologarInscricao.dart';
import 'package:uesb_eventos/src/pages/perfil.page.dart';
import 'package:uesb_eventos/src/pages/validar.page.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.only(
                   top: 80,
                  left: 10,
                ),
                child: IconButton(
                  alignment: Alignment.centerLeft,

                  onPressed: (){
                    Navigator.of(context).push<int>(
                        MaterialPageRoute(builder: (_) => PerfilPage()));
                  },
                  icon: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/perfil.png"),

                      ),
                      Text("Perfil"),
                    ],
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: const Text('Homologar Inscrição'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_) => HomologarInscricao()));
                },
              ),
              ListTile(
                title: const Text('Gerenciar Presença'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_) => GerenciarPresenca()));
                },
              ),
              ListTile(
                title: const Text('Histórico de Eventos'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_) => EventosParticipei()));
                },
              ),

            ],
          ),
        ),
        appBar: AppBar(

          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            tabs: [
              Tab( text : "home"),
              Tab( text : "Eventos"),
              Tab( text : "Validar"),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(
          children: [
            HomePage(),
            EventoPage(),
            ValidarPage(),
          ],
        ),
      ),
    );
  }
}
