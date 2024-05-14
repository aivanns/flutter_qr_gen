import 'package:flutter/material.dart';
import 'package:flutter_qr_gen/Styles/field_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String qrData = 'Hello, World!';
  final qrdataFeed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('QR Code Generator')),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            QrImageView(data: qrData),
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: primary_field
                ),
            ),
            const SizedBox(height: 200),
            Container(
              width: 500,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(40)),
              child: TextButton(
                onPressed: () async {
                  if (qrdataFeed.text.isEmpty) {
                    setState(() {
                      qrData = '';
                    });
                  }
                  else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                  }, 
                child: Text('Generate QR', style: TextStyle(color: Colors.white, fontSize: 18)), ),
            ),
          ],
        ),
      ),
    );
  }
}