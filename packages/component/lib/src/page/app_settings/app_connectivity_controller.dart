import 'dart:async';
import 'package:becomponent/src/services/connectivity_service.dart';
import 'package:becore/getx.dart';

class AppConnectivityController extends GetxController {
  final ConnectivityService _connectivityService = ConnectivityService();

  // Reactive connectivity status observable
  var isOnline = false.obs;

  StreamSubscription<bool>? _subscription;

  @override
  void onInit() {
    super.onInit();

    // Initialize connectivity service (async)
    _connectivityService.init().then((_) {
      isOnline.value = _connectivityService.isOnline;
    });

    // Subscribe to connectivity changes using the reactive stream
    _subscription = _connectivityService.isOnlineStream.listen((final status) {
      isOnline.value = status;
    });
  }

  @override
  void onClose() {
    _subscription?.cancel();
    _connectivityService.onClose();
    super.onClose();
  }

  // Optional: Methods to force offline/online mode
  void setOfflineMode(final bool offline) {
    _connectivityService.setOfflineMode(offline);
  }
}
