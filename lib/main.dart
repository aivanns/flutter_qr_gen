import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';
import 'package:flutter_qr_gen/Repositories/qr_code_repository.dart';
import 'package:flutter_qr_gen/qr_generator_app.dart';
import 'package:get_it/get_it.dart';

void main() {
  initSingletons();
  runApp(const QrGeneratorApp());
}

void initSingletons() {
  GetIt.I.registerLazySingleton<AbstractQrCodeRepository>(() => QrCodeRepository(dio: Dio()));
}

