// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

part 'qr_generator_events.dart';
part 'qr_generator_states.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc(this.qrCodeRepository) : super(QrCodeInitial()) {

    on<QrCodeLoad>((event, emit) async { 
      try {
        if (state is! QrCodeLoaded) {
          emit(QrCodeLoading());
      }
      final qrCode = await qrCodeRepository.getQrCode();
      emit(QrCodeLoaded(qrCode: qrCode));
      } catch (e) {
        emit(QrCodeLoadingFailure(exception: e));
      }
    });
  }
  final AbstractQrCodeRepository qrCodeRepository;
}
