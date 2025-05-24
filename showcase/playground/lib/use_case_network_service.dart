import 'package:beservice/begrpc.dart';
import 'package:beservice/health.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle

class BeNetworkServiceDemo extends StatefulWidget {
  const BeNetworkServiceDemo({super.key});

  @override
  State<BeNetworkServiceDemo> createState() => _BeNetworkServiceDemoState();
}

class _BeNetworkServiceDemoState extends State<BeNetworkServiceDemo> {
  late ClientChannel channel;
  late HealthCheckServiceClient stub;
  String data = 'This is a test';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeChannel();
  }

  Future<void> _initializeChannel() async {
    try {
      // For development with self-signed certs (remove in production)
      // channel = ClientChannel(
      //   'localhost',
      //   port: 5002,
      //   options: ChannelOptions(
      //     credentials: ChannelCredentials.secure(
      //       onBadCertificate: (cert, host) => true,
      //     ),
      //   ),
      // );

      // For production with real certificates:
      final certBytes = (await rootBundle.load('assets/certs/server.crt')).buffer.asUint8List();

      channel = ClientChannel(
        'localhost',
        port: 5002,
        options: ChannelOptions(
          credentials: ChannelCredentials.secure(
            certificates: certBytes,
            authority: 'localhost',
            onBadCertificate: (final cert, final host) {
              // debugPrint(
              //   'Warning: Bypassing certificate verification for $cert',
              // );
              // debugPrint(
              //   'Warning: Bypassing certificate verification for $host',
              // );
              return true; // Accept any certificate
            },
          ),
        ),
      );

      stub = HealthCheckServiceClient(channel);
    } catch (e) {
      setState(() {
        data = 'Channel initialization failed: ${e.toString()}';
      });
    }
  }

  Future<void> _checkHealth() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await stub.checkHealthService(
        CheckHealthServiceRequest(),
        options: CallOptions(timeout: const Duration(seconds: 5)),
      );

      setState(() {
        data = response.message;
      });
    } catch (e) {
      setState(() {
        data = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    channel.shutdown();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isLoading ? null : _checkHealth,
              child: isLoading ? const CircularProgressIndicator() : const Text('Check Health'),
            ),
            const SizedBox(height: 20),
            SelectableText(data),
          ],
        ),
      ),
    );
  }
}
