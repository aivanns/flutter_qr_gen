import '../MainScreen/Models/qr_code.dart';

abstract class AbstractQrCodeRepository {
  Future<QrCode> getQrCode();
}