import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

/// AppPermissionManager provides easy permission requests for common Flutter app features.
class AppPermissionManager {
  /// Requests camera permission
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  /// Requests photos/gallery permission
  static Future<bool> requestPhotosPermission() async {
    final PermissionState ps =
        await PhotoManager.requestPermissionExtend(); // the method can use optional param `permission`.
    if (ps.isAuth) {
      // Granted
      return true;
    } else if (ps.hasAccess) {
      return true;
    } else {
      return false;
    }
    // final status = await Permission.photos.request();
    // return status.isGranted;
  }

  /// Returns true if photos permission has been permanently denied
  static Future<bool> isPhotosPermanentlyDenied() async {
    return await Permission.photos.isPermanentlyDenied;
  }

  /// Opens the app's system settings page (for permanently denied permissions)
  static Future<void> openAppSettings() async {
    await openAppSettings();
  }

  /// Requests storage permission (Android)
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  /// Requests location permission (foreground)
  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  /// Requests location permission (always)
  static Future<bool> requestLocationAlwaysPermission() async {
    final status = await Permission.locationAlways.request();
    return status.isGranted;
  }

  /// Requests contacts permission
  static Future<bool> requestContactsPermission() async {
    final status = await Permission.contacts.request();
    return status.isGranted;
  }

  /// Requests notifications permission (iOS)
  static Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Requests Bluetooth permission (Android 12+)
  static Future<bool> requestBluetoothPermission() async {
    final status = await Permission.bluetooth.request();
    return status.isGranted;
  }

  /// Requests calendar permission
  static Future<bool> requestCalendarPermission() async {
    final status = await Permission.calendar.request();
    return status.isGranted;
  }

  /// Requests reminders permission (iOS)
  static Future<bool> requestRemindersPermission() async {
    final status = await Permission.reminders.request();
    return status.isGranted;
  }

  /// Requests sensors permission (e.g., for step counter)
  static Future<bool> requestSensorsPermission() async {
    final status = await Permission.sensors.request();
    return status.isGranted;
  }
}
