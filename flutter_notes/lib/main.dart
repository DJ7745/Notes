import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'init.dart';
import 'services/theme_service.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Call initApp to initialize global dependencies (ObjectBox, Storage, Theme)
  await initApp();

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Apply theme from ThemeService (Theme implementation will be expanded in Step 8)
    // final themeService = Get.find<ThemeService>();

    return GetMaterialApp(
      title: 'Flutter Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system, // To be controlled by ThemeService later
      home: const InitialScreen(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: const Center(
        child: Text('Step 3 Complete: main.dart Setup'),
      ),
    );
  }
}
