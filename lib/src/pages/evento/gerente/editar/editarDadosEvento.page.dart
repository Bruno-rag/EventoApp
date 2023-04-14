
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/models/evento.model.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/editar/mudarDetalheEvento.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarEmail.page.dart';
import 'package:uesb_eventos/src/pages/perfilPackage/mudarFone.page.dart';

import 'package:uesb_eventos/src/pages/perfilPackage/mudarSenha.page.dart';
import '../../../../controllers/auth.service.dart';
import 'mudarDataEvento.page.dart';
import 'mudarNomeEvento.page.dart';

class EditarDadosEventosPage extends StatefulWidget {
  final Atividade? evento;
  const EditarDadosEventosPage({Key? key, this.evento}) : super(key: key);

  @override
  State<EditarDadosEventosPage> createState() => _EditarDadosEventosPageState();
}

class _EditarDadosEventosPageState extends State<EditarDadosEventosPage> {

  late AuthService auth;

  @override
  void setState(VoidCallback fn) {


  }

  @override
  Widget build(BuildContext context) {
    auth = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Dados do evento" ,
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
                          Icons.pending_actions_outlined,
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
                              "Nome do evento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),
                            ),
                            Text(
                              "Editar nome do evento",
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
                    // Navigator.of(context).pop();
                     Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarNomeEvento(evento: widget.evento!,)));
                  },
                ),
              ),
              Divider(),

              //Botão Detalhes
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
                          Icons.description_rounded,
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
                              "Detalhes do evento",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),
                            ),
                            Text(
                              "Edição do detalhes do evento",
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
                    Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarDetalheEvento(evento: widget.evento!,)));
                  },
                ),
              ),

              Divider(),
              /*
                // Botão editar data
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
                          Icons.calendar_today_rounded,
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
                              "Datas",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: Colors.black87
                              ),
                            ),
                            Text(
                              "Edição das datas de início e termino do evento",
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
                    Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => MudarDataEvento(evento: widget.evento!,)));
                  },
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}
