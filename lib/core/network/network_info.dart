import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfo {
  static Future<bool> checkInternetConnection() async {
    final connectionStates = await Connectivity().checkConnectivity();

    return connectionStates.any(
      (connection) =>
          connection != ConnectivityResult.none &&
          connection != ConnectivityResult.bluetooth,
    );
  }
}
