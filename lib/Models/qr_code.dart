import 'package:equatable/equatable.dart';

class QrCode extends Equatable {
  const QrCode({required this.qrImage});

  final String qrImage;
  
  @override
  List<Object?> get props => [qrImage];
}