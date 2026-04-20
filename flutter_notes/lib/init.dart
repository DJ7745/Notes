import 'package:get/get.dart';
import 'services/database_service.dart';
import 'services/storage_service.dart';
import 'services/theme_service.dart';

Future<void> initApp() async {
  // Initialize services in order of dependency.
  // Storage is often needed by Theme, so it comes first.
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => ThemeService().init());
  
  // Database service handles the ObjectBox store creation
  await Get.putAsync(() => DatabaseService().init());
}
