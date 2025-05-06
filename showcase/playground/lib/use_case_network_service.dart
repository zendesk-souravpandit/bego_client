import 'package:beservice/begrpc.dart';
import 'package:beservice/health.service.dart';
import 'package:flutter/material.dart';

class BeNetworkServiceDemo extends StatelessWidget {
  BeNetworkServiceDemo({super.key});

  final channel = ClientChannel(
    'localhost', // Your server address
    port: 5002, // Your server port
    options: ChannelOptions(
      credentials: ChannelCredentials.secure(
        onBadCertificate:
            (cert, host) => true, // Allow self-signed certificates
      ),

      // Use secure credentials in production
    ),
  );

  @override
  Widget build(BuildContext context) {
    final stub = HealthCheckServiceClient(channel, options: CallOptions());
    var data = 'This is a test';

    return Scaffold(
      body: Column(
        children: [
          StatefulBuilder(
            builder:
                (ctx, setState) => Column(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          stub
                              .checkHealthService(
                                CheckHealthServiceRequest(),
                                options: CallOptions(),
                              )
                              .then((response) {
                                data = response.message;
                              })
                              .onError((e, stack) {
                                // print("-------------------------");
                                // print(e);
                                // print("-------------------------");
                                // print(stack);
                                data = e.toString();
                              })
                              .whenComplete(() {
                                setState(() {});
                                // print("***********************");
                              });
                        },
                        child: const Text('Click me'),
                      ),
                    ),
                    Text(data),
                  ],
                ),
          ),
          // Center(child: BeAsset.images.demoImage.image()),
        ],
      ),
    );
  }
}
