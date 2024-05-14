import 'package:flutter/material.dart';
import 'package:flutter_qr_gen/Core/routes.dart';

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
  }
}