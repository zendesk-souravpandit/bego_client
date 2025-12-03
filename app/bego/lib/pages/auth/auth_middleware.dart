import 'package:becore/getx.dart';

class AuthMiddleware extends GetMiddleware {
  AuthMiddleware();

  bool isLoggedIn = true; // Replace with actual login check logic

  @override
  RouteDecoder redirectDelegate(final RouteDecoder? route) {
    if (!isLoggedIn &&
        route?.route?.name != '/login' &&
        route?.route?.name != '/signup' &&
        route?.route?.name != '/onboarding') {
      return RouteDecoder.fromRoute('/login');
    }
    return RouteDecoder.fromRoute(route?.route?.name ?? '/app/home');
  }
}
