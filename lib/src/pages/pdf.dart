
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:uesb_eventos/src/controllers/providerEvento.controller.dart';
import '../util/util.dart';

class PdfPage extends  StatefulWidget {
  const PdfPage({super.key});
  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {

  PrintingInfo? printingInfo;
  late ProviderEvento pvdEvento;

  @override
  Widget build(BuildContext context) {
    pvdEvento = Provider.of<ProviderEvento>(context);
    pw.RichText.debug = true;
    final acitions=<PdfPreviewAction>[
      if(!kIsWeb)
        const PdfPreviewAction(icon: Icon(Icons.save), onPressed: saveAsFile)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Certificado"),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        actions: acitions,
        onPrinted: pvdEvento.showPrintedToast,
        onShared: pvdEvento.showSharedToast,
        build: pvdEvento.generatePDF,
      ),
    );
  }
}
