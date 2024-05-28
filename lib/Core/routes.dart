import 'package:flutter_qr_gen/MainScreen/qr_generator.dart';
import 'package:flutter_qr_gen/ScannerScreen/qr_scanner.dart';

final routes = {
  '/': (context) => const QrGeneratorScreen(),
  '/QrScanner': (context) => const QrCodeScanner()
};