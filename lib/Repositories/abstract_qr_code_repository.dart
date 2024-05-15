import 'dart:typed_data';

abstract class AbstractQrCodeRepository {

  String qrData = '';

  Future<Uint8List> getQrCode();
}