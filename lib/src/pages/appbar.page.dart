import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/auth.service.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/criarEvento.page.dart';
import 'package:uesb_eventos/src/pages/historico.page.dart';
import 'package:uesb_eventos/src/pages/home.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/perfil.page.dart';
import 'package:uesb_eventos/src/pages/widget/nomeSobremeUsuario.widget.dart';
import 'package:uesb_eventos/src/pages/validar.page.dart';
import 'evento/gerente/listaEventosGerenciados.page.dart';
import 'evento/inscrito/listaEventosInscritos.page.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}
class _AppBarPageState extends State<AppBarPage> {
  late AuthService auth;


  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    Color color =Colors.pink;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    color = Colors.red;
                  });
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerfilPage() ));
                },
                child: Container(
                  color: Colors.pink,
                  padding: EdgeInsets.only(
                      top: 40,
                      bottom: 20
                  ),
                  child: Column(
                    children: [

                      SizedBox(
                        height: 10,
                      ),
                      NomeSobrenomeUserWidget(),

                      // IconButton(
                      //   alignment: Alignment.centerLeft,
                      //
                      //   onPressed: (){
                      //     Navigator.of(context).push<int>(
                      //         MaterialPageRoute(builder: (_) => PerfilPage()));
                      //   },
                      //   icon: Row(
                      //     children: [
                      //       Container(
                      //
                      //         child: CircleAvatar(
                      //           backgroundImage: AssetImage("assets/perfil.png"),
                      //
                      //         ),
                      //       ),
                      //       Text("Perfil"),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              ListTile(
                leading: Icon(
                    Icons.perm_identity,
                    color: Colors.black54
                ),
                title: const Text('Gerenciar Eventos'),
                trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54
                ),

                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_) => ListaEventosGerenciadosPage()));
                },
              ),
              ListTile(
                leading: Icon(
                    Icons.event,
                    color: Colors.black54
                ),
                title: const Text('Eventos Incristos'),
                trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push<int>(
                      MaterialPageRoute(builder: (_) => ListaEventosInscritosPage()));
                },
              ),

              ListTile(
                leading: Icon(
                    Icons.history,
                    color: Colors.black54
                ),
                title: const Text('Historico de eventos'),
                trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54
                ),

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
            CriarEventoPage(),
            ValidarPage(),
          ],
        ),
      ),
    );
  }
}
