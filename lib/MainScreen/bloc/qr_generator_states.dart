part of 'qr_generator_bloc.dart';

class QrCodeState extends QrCodeBloc {}

class QrCodeInitial extends QrCodeState {}

class QrCodeLoading extends QrCodeState {}

class QrCodeLoaded extends QrCodeState {}

class QrCodeLoadingFailure extends QrCodeState {}