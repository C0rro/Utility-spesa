import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:utility_spesa/AggiungiScansionePage.dart';

class ScannerizzaBarCode extends StatefulWidget {
  @override
  _ScannerizzaBarCodeState createState() => _ScannerizzaBarCodeState();
}

class _ScannerizzaBarCodeState extends State<ScannerizzaBarCode> {
  String? barcode;
  bool isProcessing = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner Codice a Barre')),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: MobileScanner(
              onDetect: (barcodeCapture) async {
                if (isProcessing) return;

                final String code = barcodeCapture.barcodes.first.rawValue ?? '---';

                setState(() {
                  isProcessing = true;
                  barcode = code;
                });

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AggiungiScansionePage(codiceABarre: barcode),
                  ),
                );

                setState(() {
                  isProcessing = false;
                });
              },

            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                barcode == null ? 'Scansiona un codice' : 'Codice: $barcode',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
