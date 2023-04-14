import 'package:flutter/material.dart';
import 'package:uesb_eventos/src/pages/evento/inscrito/crachaVirtual.page.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/editar/editarDadosEvento.page.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/gerenciarPresenca.dart';
import 'package:uesb_eventos/src/pages/evento/gerente/homologarInscricao.dart';
import 'package:uesb_eventos/src/pages/evento/inscrito/listaAtividadeParaInscritos.page.dart';
import '../../../models/evento.model.dart';

class GerenciarEventoInscritoPage extends StatefulWidget {
  final Atividade? evento;
  const GerenciarEventoInscritoPage({Key? key, this.evento}) : super(key: key);

  @override
  State<GerenciarEventoInscritoPage> createState() => _GerenciarEventoInscritoPageState();
}

class _GerenciarEventoInscritoPageState extends State<GerenciarEventoInscritoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.evento!.nomeEvento
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
                  // Botão Atividados
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
                            Icons.pending_actions,
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
                                "Atividades do evento",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "Escolha a atividade que deseja participar",
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
                       Navigator.of(context).push<int>(MaterialPageRoute(builder: (_) => ListaAtividadePage(idEvento: widget.evento!.idEvento,)));
                    },
                  ),
                ),

                Divider(),

                //Botão certificado
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
                            Icons.document_scanner_sharp,
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
                                "Certificado",
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
                      //Navigator.of(context).push<int>( MaterialPageRoute(builder: (_) => GerenciarPresenca(idEvento: widget.evento!.idEvento)));
                    },
                  ),
                ),

                Divider(),

                //Botão crachá
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
                                "Crachá virtual",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.black87
                                ),
                              ),
                              Text(
                                "Acessar crachá virtual" ,
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
                      Navigator.of(context).push<int>( MaterialPageRoute(builder: (_) => CrachaVirtualPage(nome: widget.evento!.nomeEvento,)));
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
