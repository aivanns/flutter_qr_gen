import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

class QrCodeRepository extends AbstractQrCodeRepository {
  QrCodeRepository({required this.dio});

  final Dio dio;

  @override
  Future<Uint8List> getQrCode() async {
    final response = await dio.post('http://192.168.218.155:8080/api/qrcode/generate',
    data: {
      'data' : qrData,
      'fill' : qrColor,
      'back_color': bgColor,
      'box_size' : 8,
      'border' : 1,
    },
    options: Options(responseType: ResponseType.bytes)
    );
    try {
    return Uint8List.fromList(response.data);
    }
    catch (e) {
      return Uint8List.fromList(response.data);
    }
  }
}