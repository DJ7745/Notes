import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/theme_service.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.find<ThemeService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        children: [
          Obx(() => SwitchListTile(
            title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.w600)),
            value: themeService.isDarkMode.value,
            onChanged: (val) => themeService.switchMode(),
          )),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Theme Palette', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Obx(() => Column(
            children: ['blue', 'green', 'purple'].map((palette) {
              return RadioListTile<String>(
                title: Text(palette.capitalizeFirst!),
                value: palette,
                groupValue: themeService.currentPalette.value,
                onChanged: (val) {
                  if (val != null) themeService.switchPalette(val);
                },
              );
            }).toList(),
          )),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: Text('Contact Support'),
            subtitle: Text('support@flutter_notes.com'),
          )
        ],
      ),
    );
  }
}
