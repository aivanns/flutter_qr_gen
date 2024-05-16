import 'dart:typed_data';

abstract class AbstractQrCodeRepository {

  String qrData = '';
  String bgColor = 'white';
  String qrColor = 'black';

  Future<Uint8List> getQrCode();
}