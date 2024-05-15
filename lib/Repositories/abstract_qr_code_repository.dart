import '../MainScreen/Models/qr_code.dart';

abstract class AbstractQrCodeRepository {

  late String qrData;

  Future<QrCode> getQrCode();
}