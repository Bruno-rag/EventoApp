import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/editar/editarDadosEvento.page.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/gerenciarPresenca.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/homologarInscricao.dart';
import '../../../models/evento.model.dart';
import 'gerenciarAtividade.page.dart';

class GerenciarEventoPage extends StatefulWidget {
  final Evento? evento;
  const GerenciarEventoPage({Key? key, this.evento}) : super(key: key);

  @override
  State<GerenciarEventoPage> createState() => _GerenciarEventoPageState();
}

class _GerenciarEventoPageState extends State<GerenciarEventoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Gerenciar evento"
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Card(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                  width: 210,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image:  DecorationImage(
                      image: NetworkImage("https://media.istockphoto.com/id/974238866/pt/foto/audience-listens-to-the-lecturer-at-the-conference.jpg?s=612x612&w=0&k=20&c=ZOCjHsr2nyWVvAgjA36Kg1FaIQpvQ3oThxEf_W7JdCc="),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.24),
                        BlendMode.darken,
                      )
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),

                /*
                  Detalhes do evento
                 */
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.evento!.nomeEvento ,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Período: " + widget.evento!.inicioEvento + " a " + widget.evento!.terminoEvento,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.evento!.detalheEvento,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),

          Card(
            child: Column(
              children: [
                SizedBox(
                height: 20,
                ),
                /*
                BOTÃO EDITAR DADOS DE EVENTO
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
                            Icons.edit,
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
                                "Editar dados do evento",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "Edição de todos as informações do evento" ,
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
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.black54
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => EditarDadosEventosPage(evento: widget.evento!)));
                    },
                  ),
                ),

                Divider(),
                /*
                  // Botão homologar
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
                                "Homologar inscrições",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "aceita ou recusar as inscrições no evento",
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
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.black54
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                       Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => HomologarInscricao(idEvento: widget.evento!.idEvento,)));
                    },
                  ),
                ),

                Divider(),
                /*
                  // Botão Atividade
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
                            Icons.star,
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
                                "Gerência de atividade",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "Criar ou remover as atividades",
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
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.black54
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => GerenciarAtividadePage(idEvento: widget.evento!.idEvento,)));
                    },
                  ),
                ),

                Divider(),

                //Botão presenças
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
                            Icons.account_circle_outlined,
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
                                "Gerência de presença",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "Gerência as presença do evento" ,
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
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.black54
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.of(context).push<int>( MaterialPageRoute(builder: (_) => GerenciarPresenca(idEvento: widget.evento!.idEvento)));
                    },
                  ),
                ),

                SizedBox(
                  height: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
