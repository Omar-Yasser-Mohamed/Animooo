import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

@lazySingleton
class NetworkConnectivity {
  final Connectivity _connectivity;
  StreamSubscription? _subscription;

  bool _wasDisconnected = false;

  NetworkConnectivity(this._connectivity);

  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  void listeningToConnectivity({
    required Function onConnected,
    VoidCallback? onDisconnected,
  }) {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) {
        if (results.contains(ConnectivityResult.none)) {
          _wasDisconnected = true;
          onDisconnected?.call();
        } else {
          if (_wasDisconnected) {
            _wasDisconnected = false;
            onConnected();
          }
        }
      },
    );
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }
}