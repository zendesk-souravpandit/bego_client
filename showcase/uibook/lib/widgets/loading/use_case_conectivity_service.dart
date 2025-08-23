import 'dart:async';
import 'package:becomponent/services.dart';
import 'package:becore/getx.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'ConnectivityService', path: 'widget/ConnectivityService', type: ConnectivityService)
Widget useCaseBeSkeleton(final BuildContext context) {
  return const ConnectivityServiceUseCase();
}

/// Comprehensive usecase widget demonstrating ConnectivityService functionality
class ConnectivityServiceUseCase extends StatefulWidget {
  const ConnectivityServiceUseCase({super.key});

  @override
  State<ConnectivityServiceUseCase> createState() => _ConnectivityServiceUseCaseState();
}

class _ConnectivityServiceUseCaseState extends State<ConnectivityServiceUseCase> {
  late ConnectivityService _connectivityService;
  bool _isInitialized = false;
  final List<String> _logs = [];
  StreamSubscription<bool>? _statusSubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivityService();
  }

  Future<void> _initConnectivityService() async {
    _connectivityService = ConnectivityService();
    await _connectivityService.init();

    // Subscribe to connectivity changes for logging
    _statusSubscription = _connectivityService.isOnlineStream.listen((final status) {
      _addLog('Connectivity changed: ${status ? "ONLINE" : "OFFLINE"}');
    });

    setState(() {
      _isInitialized = true;
    });

    _addLog('ConnectivityService initialized');
  }

  void _addLog(final String message) {
    setState(() {
      _logs.insert(0, '${DateTime.now().toString().substring(11, 19)}: $message');
      if (_logs.length > 20) _logs.removeLast();
    });
  }

  void _clearLogs() {
    setState(_logs.clear);
  }

  @override
  void dispose() {
    _statusSubscription?.cancel();
    if (_isInitialized) {
      _connectivityService.onClose();
    }
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isInitialized ? _buildInitializedView() : _buildLoadingView(),
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Initializing ConnectivityService...')],
      ),
    );
  }

  Widget _buildInitializedView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(),
          const SizedBox(height: 16),
          _buildControlsCard(),
          const SizedBox(height: 16),
          _buildUseCasesCard(),
          const SizedBox(height: 16),
          _buildLogsCard(),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.signal_wifi_4_bar, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Current Status',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() {
              final isOnline = _connectivityService.isOnlineStream.value;
              final isInitialized = _connectivityService.isInitialized;

              return Column(
                children: [
                  _buildStatusIndicator(
                    'Connection Status',
                    isOnline ? 'ONLINE' : 'OFFLINE',
                    isOnline ? Colors.green : Colors.red,
                    isOnline ? Icons.wifi : Icons.wifi_off,
                  ),
                  const SizedBox(height: 8),
                  _buildStatusIndicator(
                    'Service Status',
                    isInitialized ? 'INITIALIZED' : 'NOT INITIALIZED',
                    isInitialized ? Colors.blue : Colors.orange,
                    isInitialized ? Icons.check_circle : Icons.pending,
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(final String label, final String status, final Color color, final IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700])),
          Text(status, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          const Spacer(),
          Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
        ],
      ),
    );
  }

  Widget _buildControlsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.settings, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Manual Controls',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _connectivityService.setOfflineMode(true);
                      _addLog('Force offline mode enabled');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.wifi_off, color: Colors.white), SizedBox(width: 8), Text('Force Offline')],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _connectivityService.setOfflineMode(false);
                      _addLog('Force offline mode disabled');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.wifi, color: Colors.white), SizedBox(width: 8), Text('Auto Detect')],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUseCasesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.play_circle_outline, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Common Use Cases',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildUseCaseItem(
              'Network Request Simulation',
              'Simulate making a network request',
              Icons.cloud_download,
              _simulateNetworkRequest,
            ),
            const SizedBox(height: 8),
            _buildUseCaseItem(
              'Offline Queue Simulation',
              'Add items to offline queue',
              Icons.queue,
              _simulateOfflineQueue,
            ),
            const SizedBox(height: 8),
            _buildUseCaseItem('Sync Status Check', 'Check if data can be synced', Icons.sync, _checkSyncStatus),
          ],
        ),
      ),
    );
  }

  Widget _buildUseCaseItem(
    final String title,
    final String description,
    final IconData icon,
    final VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(description, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _buildLogsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.article, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Activity Logs',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(onPressed: _clearLogs, icon: const Icon(Icons.clear_all), tooltip: 'Clear logs'),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child:
                  _logs.isEmpty
                      ? const Center(child: Text('No activity logs yet...', style: TextStyle(color: Colors.grey)))
                      : ListView.builder(
                        itemCount: _logs.length,
                        itemBuilder: (final context, final index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(_logs[index], style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  void _simulateNetworkRequest() {
    if (_connectivityService.isOnline) {
      _addLog('✅ Network request: SUCCESS (Device is online)');

      // Simulate network delay
      Future.delayed(const Duration(milliseconds: 500), () {
        _addLog('📦 Data received from server');
      });
    } else {
      _addLog('❌ Network request: FAILED (Device is offline)');
      _addLog('💾 Request saved to offline queue');
    }
  }

  void _simulateOfflineQueue() {
    if (_connectivityService.isOnline) {
      _addLog('📤 Processing offline queue (online)');
      _addLog('✅ Offline items synced to server');
    } else {
      _addLog('💾 Added item to offline queue');
      _addLog('⏳ Will sync when connection is restored');
    }
  }

  void _checkSyncStatus() {
    final canSync = _connectivityService.isOnline;
    _addLog('🔄 Sync check: ${canSync ? "READY" : "WAITING"}');

    if (canSync) {
      _addLog('🚀 Starting background sync...');
    } else {
      _addLog('📴 Sync postponed until online');
    }
  }
}
