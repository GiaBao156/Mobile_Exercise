import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const UTHSmartTasksApp(),
    ),
  );
}

class UTHSmartTasksApp extends StatelessWidget {
  const UTHSmartTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'UTH SmartTasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFB800),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
