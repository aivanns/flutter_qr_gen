import 'package:dio/dio.dart';
import 'package:flutter_qr_gen/MainScreen/Models/qr_code.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

class QrCodeRepository extends AbstractQrCodeRepository {
  QrCodeRepository({required this.dio});

  final Dio dio;

  @override
  Future<QrCode> getQrCode() async {
    final response = await dio.post('http://192.168.31.102:8090/api/qrcode/generate}',
    data: {
      'data' : qrData
    });
    return response.data;
  }
}