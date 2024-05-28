import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';
import 'package:flutter_qr_gen/Styles/field_styles.dart';
import 'package:get_it/get_it.dart';
import 'package:sizer/sizer.dart';

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

  Color bgColor = Colors.white;
  Color qrColor = Colors.black;

  String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
}

  void _openColorPickerBg(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выберите цвет'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: bgColor,
              onColorChanged: (Color color) {
                setState(() {
                  bgColor = color;
                  GetIt.I<AbstractQrCodeRepository>().bgColor = colorToHex(bgColor);
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Готово'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPickerQr(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выберите цвет'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: qrColor,
              onColorChanged: (Color color) {
                setState(() {
                  qrColor = color;
                  GetIt.I<AbstractQrCodeRepository>().qrColor = colorToHex(qrColor);
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Готово'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
        child: Column(
          children: [
            Container(
              height: 8.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12
              ),
              child: const Center(child: Text('Generate your QR', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700, fontFamily: "Inter"),)),
            ),
            SizedBox(height: 5.h,),
            BlocBuilder<QrCodeBloc, QrCodeState>(
              bloc: _qrCodeBloc,
              builder: (context, state) {
                if (state is QrCodeLoaded) {
                  return Container(
                    height: 38.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                      child: Image.memory(state.qrCode, fit: BoxFit.fill,)
                      )
                    );
                } else if (state is QrCodeLoading) {
                  return  SizedBox(
                    height: 38.h,
                    child: const Center(child: CircularProgressIndicator()),);
                }
                if (state is QrCodeLoadingFailure) {
                  return SizedBox(
                    height: 38.h,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('An error occured', style: TextStyle(color: Colors.black87, fontSize: 26)),
                        Text('Please try again', style: TextStyle(color: Colors.black54, fontSize: 18)),
                      ],
                    )
                  );
                } else {
                  return SizedBox(height: 38.h,);
                }
              },
            ),  
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Row(
                children: [
                  Column(
                    children: [
                  const Text(
                    'Цвет фона:',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 20.w,
                    height: 9.5.h,
                    decoration: BoxDecoration(
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _openColorPickerBg(context),
                    child: const Text('Выбрать цвет'),
                  ),
                            ],
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    children: [
                      const Text(
                'Цвет QR:',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Container(
                width: 20.w,
                height: 9.5.h,
                decoration: BoxDecoration(
                      color: qrColor,
                      boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                        ),
                      ],
                    ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _openColorPickerQr(context);
                  },
                child: const Text('Выбрать цвет'),
              ),
                    ],
                  )
                ],
              ),
            ),
              SizedBox(height: 2.h,),
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextField(
                      decoration: primary_field,
                      controller: qrdataFeed,
                      ),
                  ),
                  SizedBox(height: 3.h,),
                  Container(
                    width: 50.w,
                    height: 7.h,
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 52, 58, 64), borderRadius: BorderRadius.circular(40)),
                    child: TextButton(
                      onPressed: () async {
                        GetIt.I<AbstractQrCodeRepository>().qrData = qrdataFeed.text;
                        _qrCodeBloc.add(QrCodeLoad());
                          setState(() {});
                        },
                      child: const Text('Generate', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300)), ),
                  ),
          ],
        ),
      ),
    );
  }
}
        