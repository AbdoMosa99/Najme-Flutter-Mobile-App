import 'package:connectivity_plus/connectivity_plus.dart';

class Internet {
  static Future<ConnectionStatus> hasConnection() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    return (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.ethernet ||
            connectivityResult == ConnectivityResult.bluetooth)
        ? ConnectionStatus.hasConnection
        : ConnectionStatus.noConnection;
  }
}

enum ConnectionStatus { hasConnection, noConnection }
