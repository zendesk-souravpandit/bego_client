import 'dart:async';
import 'package:becore/getx.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityService extends GetxService {
  final _isOnline = false.obs;
  bool _forceOffline = false;
  bool _isInitialized = false;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  void _log(final String message) {
    if (kDebugMode) {
      print('[ConnectivityService] $message');
    }
  }

  /// Public reactive connectivity status
  RxBool get isOnlineStream => _isOnline;

  bool get isOnline => _isOnline.value;

  bool get isInitialized => _isInitialized;

  Future<ConnectivityService> init() async {
    if (_isInitialized) {
      _log('Service already initialized');
      return this;
    }

    _log('Initializing ConnectivityService...');

    // Check initial connection status
    await _checkInitialConnectivity();

    // Listen for connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      final List<ConnectivityResult> results,
    ) {
      final wasOnline = _isOnline.value;
      final networkOnline = results.any((final result) => result != ConnectivityResult.none);
      _isOnline.value = networkOnline && !_forceOffline;

      _log(
        'Connectivity changed: ${_isOnline.value} '
        '(Network: $networkOnline, Forced offline: $_forceOffline)',
      );

      if (!wasOnline && _isOnline.value) {
        _log('🔗 Back online!');
      } else if (wasOnline && !_isOnline.value) {
        _log('📴 Went offline!');
      }
    });

    _isInitialized = true;

    return this;
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
      final networkOnline = results.any((final result) => result != ConnectivityResult.none);
      _isOnline.value = networkOnline && !_forceOffline;
      _log('Initial connectivity: ${_isOnline.value}');
    } catch (e) {
      _log('Failed initial connectivity check: $e');
      _isOnline.value = false;
    }
  }

  /// Set forced offline state
  void setOfflineMode(final bool offline) {
    _forceOffline = offline;
    final wasOnline = _isOnline.value;
    Connectivity().checkConnectivity().then((final List<ConnectivityResult> results) {
      final networkOnline = results.any((final result) => result != ConnectivityResult.none);
      _isOnline.value = networkOnline && !_forceOffline;
      if (wasOnline != _isOnline.value) {
        _log('Forced offline mode changed: $_forceOffline, Online: ${_isOnline.value}');
      }
    });
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
    _log('ConnectivityService disposed');
  }
}
