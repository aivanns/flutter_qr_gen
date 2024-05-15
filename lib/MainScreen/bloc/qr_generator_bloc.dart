// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_qr_gen/MainScreen/Models/qr_code.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';

part 'qr_generator_events.dart';
part 'qr_generator_states.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc(
    this.qrCodeRepository,
  ) : super(QrCodeInitial()) {
    on<QrCodeEvent>((event, emit) async {
      emit(QrCodeLoading());
      final qrCode = await qrCodeRepository.getQrCode();
      emit(QrCodeLoaded());
    });
  }
  final AbstractQrCodeRepository qrCodeRepository;
}
