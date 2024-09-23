import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {

  //Permette di identificare univocamente una risorsa in flutter, usata per far funzionare reassemble()
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;  //Contiene il risultato della scansione (null || QR)
  QRViewController? controller; //Permette il controllo della fotocamera, ascoltando i risultati della scansione in _onQRViewCreated

  //Permette di ricostruire la fotocamera nel caso si cambi la rotazione del cell
  @override
  void reassemble(){
    super.reassemble();
    if(controller != null) { controller!.pauseCamera(); }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 325,
          width: 275,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                //Widget che visualizza la telecamera e permette la scansione del QR
                child: QRView(
                  key: qrKey,                 //Usata per reassemble
                  onQRViewCreated: _onQRViewCreated,
                  //Bordo che indica dove scannerizzare
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.green,  //Colore bordo
                    borderRadius: 10,         //Quanto arrotondare i bordi
                    borderLength: 50,         //Lunghezza bordo (parte colorata)
                    borderWidth: 10,          //Spessore bordo (parte colorata)
                    cutOutSize: 350,          //Dimensione del riquadro (non sfora)
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    (result != null) ? "Trovato QR: ${result!.code}" : "Scansiona un codice QR",
                    style: const TextStyle(fontSize: 20),
                  ),//(result != null) ? Text("Trovato QR: ${result!.code}") : const Text("Scansiona un codice QR"),
                ),
              )
            ],
          ),
        ),
    );
  }


  //Monitora lo stream di dati scansionati
  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    //Ascolta i dati ricevuti e verifica se "vede" un QR
    controller.scannedDataStream.listen((scanData) { setState(() { result = scanData; }); });
    //Il valore scansionato sarà in result.code
  }

  //Permette di restituire correttamente le risorse della fotocamera una volta terminato
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

}
