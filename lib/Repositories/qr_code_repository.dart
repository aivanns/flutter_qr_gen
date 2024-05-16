import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

class QrCodeRepository extends AbstractQrCodeRepository {
  QrCodeRepository({required this.dio});

  final Dio dio;

  @override
  Future<Uint8List> getQrCode() async {
    final response = await dio.post('http://5.42.220.228:8090/api/qrcode/generate',
    data: {
      'data' : qrData,
      'box_size' : 30,
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