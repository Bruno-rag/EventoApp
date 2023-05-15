
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:io';

class ProviderEvento extends ChangeNotifier {

  Future criarEvento() async{
    final dataEvento = FirebaseFirestore.instance.collection("teste").doc();
    final data = {
      "idEvento": dataEvento.id,
      "nomeEvento": dataEvento.runtimeType.toString(),
      "inicioEvento": dataEvento.hashCode.toString(),
      "terminoEvento": dataEvento.hashCode.toString(),
      "urlAvatar" : "https://media.istockphoto.com/id/1385168396/pt/foto/people-registering-for-the-conference-event.jpg?s=612x612&w=0&k=20&c=UkdhV6KD1JC43SyAKWWh4z4El3HE_wdBjUKdlIZKsFk=",
      "detalheEvento": dataEvento.hashCode.toString(),
      "atividaEvento": dataEvento.hashCode.toString(),
      "idOrganizador": dataEvento.hashCode.toString(),
    };
    dataEvento.set(data).
    onError((e, _) => print("Error writing document: $e"));
  }

  Future criarInscrito(String idUsuario, String collection, String idEvento, String nome, String sobrenome, String fone, String urlAvatar, String dataNas, String email) async{

    final data = {
      "idUsuario": idUsuario,
      "nome": nome,
      "sobrenome": sobrenome,
      "fone": fone,
      "urlAvatar" : urlAvatar,
      "dataNas": dataNas,
      "email": email,
    };
    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(collection).doc(idUsuario).set(data);
  }

  Future deletaInscrito(String idUsuario, String collection, String idEvento) async{

    final dataUser = FirebaseFirestore.instance.collection("eventos").
    doc(idEvento).collection(collection).doc(idUsuario).delete();
  }

  /*
  Gerência de pdf
   */

  Future<Uint8List>generatePDF(final PdfPageFormat format)async{
    final doc = pw.Document(
      title: "Cetificado",
    );
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo1.png')).buffer.asUint8List(),
    );
    final footerImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo1.png')).buffer.asUint8List(),
    );

    final pageTheme = await _myPageTheme(format);
    doc.addPage(
        pw.MultiPage(build: (context){
          return [
            pw.Container(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                          'Certificado',
                          style: const pw.TextStyle(
                            fontSize: 55,
                          )
                      ),
                      pw.Divider(),
                      pw.SizedBox(height: 40),
                      pw.Text(
                          'Concedido a',
                          style: const pw.TextStyle(
                            fontSize: 30,
                          )
                      ),
                      pw.Text(
                          'Nome do usuario',
                          style:  pw.TextStyle(
                            fontSize: 35,
                            fontWeight: pw.FontWeight.bold,
                          )
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text(
                          'Pela participação do evento ',
                          style:  pw.TextStyle(
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold,
                          )
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text(
                          'Na Universidade Estadual do Sudoeste ds Bahia - Campus jequié',
                          style:  pw.TextStyle(
                            fontSize:25,
                            fontWeight: pw.FontWeight.bold,
                          )
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text(
                          'Participação como "Função" ',
                          style:  pw.TextStyle(
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold,
                          )
                      ),
                    ]
                )
            )
          ];
        })
      /*
    Outra forma de fazer o pw.MultiPage
     */
      // pw.MultiPage(
      //  pageTheme: pageTheme,
      //   header: (final context)=>pw.Image(
      //
      //     alignment: pw.Alignment.topRight,
      //     logoImage,
      //     fit:  pw.BoxFit.scaleDown,
      //     width: 180,
      //   ),
      //   // footer:(final context)=>pw.Image(
      //   //   footerImage,
      //   // ),
      //   build: (final context)=>[
      //     pw.Container(
      //       padding: const pw.EdgeInsets.only(left: 30,bottom: 20),
      //       child: pw.Column(
      //         crossAxisAlignment: pw.CrossAxisAlignment.center,
      //         mainAxisAlignment: pw.MainAxisAlignment.start,
      //         children: [
      //           pw.Padding(padding: const pw.EdgeInsets.only(top:20)),
      //           pw.Row(
      //             crossAxisAlignment: pw.CrossAxisAlignment.center,
      //             mainAxisAlignment: pw.MainAxisAlignment.center,
      //             children: [
      //               pw.Column(
      //                 children: [
      //                   pw.Text(
      //                     'Certificado',
      //                     style: const pw.TextStyle(
      //                       fontSize: 55,
      //                     )
      //
      //                   ),
      //                 ]
      //               )
      //             ]
      //           )
      //         ]
      //       )
      //     )
      //   ]
      // )
    );
    return doc.save();
  }
  Future<pw.PageTheme>_myPageTheme(PdfPageFormat format)async{
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo1.png')).buffer.asUint8List(),
    );
    return  pw.PageTheme(
        margin: const pw.EdgeInsets.symmetric(
            horizontal: 1*PdfPageFormat.cm,vertical: 0.5*PdfPageFormat.cm
        ),
        textDirection: pw.TextDirection.ltr,
        orientation: pw.PageOrientation.portrait,
        buildBackground: (final context)=>
            pw.FullPage(
                ignoreMargins: true,
                child: pw.Watermark(
                    angle: 20,
                    child: pw.Opacity(
                        opacity: 0.5,
                        child: pw.Image(
                          alignment: pw.Alignment.center,
                          logoImage,
                          fit: pw.BoxFit.cover,
                        )
                    )
                )
            )
    );
  }
  Future<void> saveAsFile(
      final BuildContext context,
      final LayoutCallback build,
      final PdfPageFormat pageFormat,
      )async{
    final bytes = await build(pageFormat);
    final appDocDir = await getApplicationSupportDirectory();
    final appDocPath = appDocDir.path;
    final file=File('$appDocPath/document.pdf');
    print('save as file ${file.path}...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }
  void showPrintedToast(final BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document printed successfully'))
    );
  }
  void showSharedToast(final BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Document shared successfully'))
    );
  }
}