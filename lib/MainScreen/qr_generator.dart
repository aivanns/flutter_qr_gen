import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';
import 'package:flutter_qr_gen/Styles/field_styles.dart';
import 'package:get_it/get_it.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('QR Code Generator')),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          children: [
            BlocBuilder<QrCodeBloc, QrCodeState>(
              bloc: _qrCodeBloc,
              builder: (context, state) {
                if (state is QrCodeLoaded) {
                  return Image.memory(state.qrCode);
                } else if (state is QrCodeLoading) {
                  return const SizedBox(
                    height: 400,
                    child: Center(child: CircularProgressIndicator()),);
                } else {
                  return const SizedBox(height: 400,);
                }
              },
            ),
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
                        _qrCodeBloc.add(QrCodeLoad());
                          setState(() {});
                        }, 
                      child: const Text('Generate QR', style: TextStyle(color: Colors.white, fontSize: 18)), ),
                  ),
          ],
        ),
      ),
    );
  }
}
        