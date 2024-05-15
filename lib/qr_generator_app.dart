import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_gen/Core/routes.dart';
import 'package:flutter_qr_gen/MainScreen/bloc/qr_generator_bloc.dart';

import 'Themes/theme.dart';

class QrGeneratorApp extends StatelessWidget {
  const QrGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QrGeneratorApp',
        theme: mainTheme,
        routes: routes,
      );
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => QrCodeBloc()
    //     )
    //   ],
    //   child: MaterialApp(
    //     title: 'QrGeneratorApp',
    //     theme: mainTheme,
    //     routes: routes,
    //   ),
    // );
  }
}
