import 'package:dio/dio.dart';
import 'package:flutter_qr_gen/Models/qr_code.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

class QrCodeRepository {
  QrCodeRepository({required this.dio});

  final Dio dio;

}