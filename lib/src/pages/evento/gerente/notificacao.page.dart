
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uesb_eventos/src/pages/appBar.page.dart';



class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({Key? key}) : super(key: key);

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {

  final formKey = GlobalKey<FormState>();
  final nomeEvento = TextEditingController() ;
  final inicioEvento = TextEditingController() ;
  final terminoEvento = TextEditingController() ;
  final detalheEvento = TextEditingController() ;
  final atividadeEvento = TextEditingController() ;

  var mascaraDataInicio = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
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
            Text(
              "Enviar notificação",
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

            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        icon: Icon(Icons.perm_contact_cal_outlined),
                        labelText: "Nome do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      nomeEvento.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),


                  TextFormField(
                    inputFormatters: [mascaraDataInicio],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Início do evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      inicioEvento.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    inputFormatters: [mascaraDataInicio],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(Icons.event),
                        labelText: "Término do Evento",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      terminoEvento.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(

                        labelText: "Messagem",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                    ),
                    onChanged: (texto){
                      detalheEvento.text = texto;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.black87,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          Navigator.of(context).push<int>(
                              MaterialPageRoute(builder: (_) => AppBarPage()));
                        }
                      },
                      child: Text(
                        "Enviar",
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
          ],
        ),
      ),
    );
  }
}
