part of 'qr_generator_bloc.dart';

abstract class QrCodeState {}

class QrCodeInitial extends QrCodeState {}

class QrCodeLoading extends QrCodeState {}

class QrCodeLoaded extends QrCodeState {
  QrCodeLoaded({required this.qrCode});

  final Uint8List qrCode;
}

class QrCodeLoadingFailure extends QrCodeState {
  QrCodeLoadingFailure({required this.exception});

  final Object? exception;
}