import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';
import 'package:flutter_qr_gen/Repositories/qr_code_repository.dart';
import 'package:flutter_qr_gen/Styles/field_styles.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'bloc/qr_generator_bloc.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  final qrdataFeed = TextEditingController();
  String qrData = '';
  final _qrCodeBloc = QrCodeBloc(GetIt.I<AbstractQrCodeRepository>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('QR Code Generator')),
      ),
      body: BlocBuilder<QrCodeBloc, QrCodeState>(
        bloc: _qrCodeBloc,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            GetIt.I<AbstractQrCodeRepository>().qrData == '' && qrdataFeed.text.toString() == '' ? const SizedBox(height: 5,) :
            Image.memory(QrCodeRepository(dio: Dio()).getQrCode()),
            //QrImageView(data: GetIt.I<AbstractQrCodeRepository>().qrData),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                decoration: primary_field,
                controller: qrdataFeed,
                ),
            ),
            const SizedBox(height: 200),
            Container(
              width: 500,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(40)),
              child: TextButton(
                onPressed: () async {
                  GetIt.I<AbstractQrCodeRepository>().qrData = qrdataFeed.text;
                  _qrCodeBloc.add(QrCodeEvent());
                    setState(() {});
                  }, 
                child: Text('Generate QR', style: TextStyle(color: Colors.white, fontSize: 18)), ),
            ),
          ],
        ),
          );
        },
      ),
    );
  }
}
        