// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:flutter_qr_gen/MainScreen/Models/qr_code.dart';
import 'package:flutter_qr_gen/Repositories/abstract_qr_code_repository.dart';
import 'package:get_it/get_it.dart';

part 'qr_generator_events.dart';
part 'qr_generator_states.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<QrCodeEvent>((event, emit) async {
      emit(QrCodeLoading());
      final qrCode = GetIt.I<AbstractQrCodeRepository>().getQrCode();
      emit(QrCodeLoaded());
    });
  }
}
