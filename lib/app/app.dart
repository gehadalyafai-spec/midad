import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';
import 'theme/app_theme.dart';

class MidadApp extends StatelessWidget {
  const MidadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مداد',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const HomeScreen(),
    );
  }
}
