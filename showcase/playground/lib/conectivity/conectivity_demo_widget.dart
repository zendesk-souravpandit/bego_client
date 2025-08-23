import 'package:becomponent/services.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

class ConnectivityShowcaseWidget extends StatefulWidget {
  const ConnectivityShowcaseWidget({super.key});

  @override
  State<ConnectivityShowcaseWidget> createState() => _ConnectivityShowcaseWidgetState();
}

class _ConnectivityShowcaseWidgetState extends State<ConnectivityShowcaseWidget> {
  late ConnectivityService _connectivityService;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initConnectivityService();
  }

  Future<void> _initConnectivityService() async {
    _connectivityService = ConnectivityService();
    await _connectivityService.init();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    if (_isInitialized) {
      _connectivityService.onClose();
    }
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    if (!_isInitialized) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Connectivity Service', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text('Initializing...'),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Connectivity Showcase', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Real-time status display
            Obx(() {
              final isOnline = _connectivityService.isOnlineStream.value;
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isOnline ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: isOnline ? Colors.green : Colors.red, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(isOnline ? Icons.wifi : Icons.wifi_off, color: isOnline ? Colors.green : Colors.red, size: 24),
                    const SizedBox(width: 12),
                    Text(
                      isOnline ? 'ONLINE' : 'OFFLINE',
                      style: TextStyle(
                        color: isOnline ? Colors.green.shade800 : Colors.red.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: isOnline ? Colors.green : Colors.red),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16),

            // Control buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _connectivityService.setOfflineMode(true),
                    icon: const Icon(Icons.wifi_off),
                    label: const Text('Force Offline'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red.shade800,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _connectivityService.setOfflineMode(false),
                    icon: const Icon(Icons.wifi),
                    label: const Text('Force Online'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                      foregroundColor: Colors.green.shade800,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Info text
            const Text(
              'This widget demonstrates real-time connectivity status monitoring. '
              'Try turning off your WiFi/mobile data or use the force offline button to see the status change.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
