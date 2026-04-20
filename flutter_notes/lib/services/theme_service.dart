import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_theme.dart';
import 'storage_service.dart';

class ThemeService extends GetxService {
  final StorageService _storage = Get.find<StorageService>();

  final _isDarkKey = 'isDarkMode';
  final _paletteKey = 'themePalette';

  final RxBool isDarkMode = false.obs;
  final RxString currentPalette = 'blue'.obs;

  Future<ThemeService> init() async {
    isDarkMode.value = _storage.getBool(_isDarkKey, defaultValue: false);
    currentPalette.value = _storage.getString(_paletteKey, defaultValue: 'blue');
    return this;
  }

  ThemeMode get themeMode => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  ThemeData get theme => AppTheme.getTheme(currentPalette.value, isDark: isDarkMode.value);

  void switchMode() {
    isDarkMode.value = !isDarkMode.value;
    _storage.setBool(_isDarkKey, isDarkMode.value);
    Get.changeThemeMode(themeMode);
  }

  void switchPalette(String paletteName) {
    currentPalette.value = paletteName;
    _storage.setString(_paletteKey, paletteName);
    Get.changeTheme(theme);
  }
}
