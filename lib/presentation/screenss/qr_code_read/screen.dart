import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazar/presentation/screenss/qr_code_read/widgets/choice_video_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanScreen extends StatefulWidget {
  const QrCodeScanScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScanScreen> createState() => _QrCodeScanScreenState();
}

class _QrCodeScanScreenState extends State<QrCodeScanScreen> {
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  bool code = false;
  double witdh = 0;
  List<String> data = [];
  bool isFlash = false;

  Future<void> getRightQrCode() async {
    if (barcode!.code == "Registon maydoni") {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChoiceVideoScreen()));
      });
    } else {
      const snackBar = SnackBar(
        content: Text(
          'Ishlov jarayonida. \nHozircha mavjud emas',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void initial() async {
    code = true;
    controller?.dispose();
    await Future.delayed(const Duration(seconds: 1));
    controller?.resumeCamera();
    setState(() {
      barcode != null
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChoiceVideoScreen(),
              ),
            )
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildQRView(),
            Align(
              alignment: Alignment.topCenter,
              child: MaterialButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  setState(() {
                    isFlash = !isFlash;
                    controller?.toggleFlash();
                  });
                },
                child: isFlash
                    ? const Icon(
                        CupertinoIcons.lightbulb_fill,
                        color: Colors.yellow,
                      )
                    : const Icon(CupertinoIcons.lightbulb_slash_fill),
              ),
            ),
            Positioned(
              bottom: 20,
              child: buildResuld(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQRView() {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRView,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width - 80,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.blue),
    );
  }

  Widget buildResuld() {
    return Column(
      children: [
        // Container(
        //   width: MediaQuery.of(context).size.width - 40,
        //   padding: const EdgeInsets.all(7),
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(5),
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.white.withOpacity(.3),
        //             blurRadius: 7,
        //             spreadRadius: 2)
        //       ]),
        //   child: Text(
        //     barcode != null ? "Natija: ${barcode!.code}" : "Scaner kodi",
        //     maxLines: 2,
        //     style: const TextStyle(
        //         color: Colors.black, overflow: TextOverflow.ellipsis),
        //   ),
        // ),
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            barcode != null
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChoiceVideoScreen(),
                    ),
                  )
                : null;
          },
          minWidth: 200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: barcode != null ? Colors.white : Colors.grey.withOpacity(0.5),
          child: const Text(
            "Open",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  void onQRView(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
        }));
  }
}
