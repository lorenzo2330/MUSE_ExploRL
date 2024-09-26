import 'package:app_rl/providers/energy_provider.dart';
import 'package:app_rl/providers/exhibit_provider.dart';
import 'package:app_rl/res/my_int.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../models/exhibit_list.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key, required BuildContext context});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  //Permette di identificare univocamente una risorsa in flutter, usata per far funzionare reassemble()
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result; //Contiene il risultato della scansione (null || QR)
  QRViewController?
      controller; //Permette il controllo della fotocamera, ascoltando i risultati della scansione in _onQRViewCreated

  //Permette di ricostruire la fotocamera nel caso si cambi la rotazione del cell
  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MyInt.qrSize.height,
        width: MyInt.qrSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Vai al piano ${context.read<ExhibitProvider>().nextExhibit.nPiano}",
                  style: const TextStyle(fontSize: 20),
                ), //(result != null) ? Text("Trovato QR: ${result!.code}") : const Text("Scansiona un codice QR"),
              ),
            ),
            Expanded(
              flex: 8,
              //Widget che visualizza la telecamera e permette la scansione del QR
              child: QRView(
                key: qrKey, //Usata per reassemble
                onQRViewCreated: _onQRViewCreated,
                //Bordo che indica dove scannerizzare
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.green,
                  //Colore bordo
                  borderRadius: 10,
                  //Quanto arrotondare i bordi
                  borderLength: 50,
                  //Lunghezza bordo (parte colorata)
                  borderWidth: 10,
                  //Spessore bordo (parte colorata)
                  cutOutSize: 350, //Dimensione del riquadro (non sfora)
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  (result != null)
                      ? context.watch<ExhibitProvider>().scansioneCorretta
                          ? "Trovato QR corretto: ${result!.code}"
                          : "Trovato QR errato: ${result!.code}"
                      : "Scansiona il QR code",
                  style:
                  (result != null)
                      ? const TextStyle(fontSize: 12)
                      : const TextStyle(fontSize: 20),
                ), //(result != null) ? Text("Trovato QR: ${result!.code}") : const Text("Scansiona un codice QR"),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Monitora lo stream di dati scansionati
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    /*  Serve usare questa sintassi poichè, non trovandoci in un metodo
        di build, non è possibile usare direttamente context.watch<...>() */
    var exProv = context.read<ExhibitProvider>();
    var enProv = context.read<EnergyProvider>();

    //Permette di decrementare comunque l'energia per l'opossum nel caso ci si ritorni
    bool firstScan =
        exProv.nextExhibit == ExhibitList.startingExhibit &&  //Scansiono il primo exhibit
        enProv.energy == EnergyProvider.maxEnergy;            //Sono ancora full energia

    bool noDecrease = exProv.inTutorial || firstScan;

    //Ascolta i dati ricevuti e verifica se "vede" un QR
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if(ExhibitList.scannedExhibit(scanData.code ?? "retFalse")){
          if (scanData.code == exProv.nextExhibit.normalName) {
            exProv.setScansioneCorretta();
            exProv.visit(context.read<ExhibitProvider>().nextExhibit);
            if (!noDecrease) {
              enProv.decreaseEnergy();
            }
          }
          result = scanData;
        }
      });
    });
    //Il valore scansionato sarà in result.code
  }

  //Permette di restituire correttamente le risorse della fotocamera una volta terminato
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
