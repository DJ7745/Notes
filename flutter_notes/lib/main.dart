import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'init.dart';
import 'services/theme_service.dart';
import 'core/theme/app_theme.dart';
import 'core/bindings/root_binding.dart';
import 'modules/home/views/home_view.dart';

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
    // Apply theme from ThemeService
    final themeService = Get.find<ThemeService>();

    return Obx(() => GetMaterialApp(
      title: 'Flutter Notes',
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      theme: AppTheme.getTheme(themeService.currentPalette.value, isDark: false),
      darkTheme: AppTheme.getTheme(themeService.currentPalette.value, isDark: true),
      themeMode: themeService.themeMode, // Controlled by ThemeService
      home: const HomeView(),
    ));
  }

}
