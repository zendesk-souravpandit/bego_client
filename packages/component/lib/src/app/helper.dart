import 'package:becore/getx.dart' show GetPage, GetMiddleware;

List<GetPage<T>> addGlobalMiddleware<T>(
  final List<GetPage<T>> pages,
  final List<GetMiddleware> middlewares,
) {
  return pages.map((final page) {
    return page.copyWith(
      middlewares: [
        ...middlewares,
        ...page.middlewares, // keep original middlewares too
      ],
    );
  }).toList();
}
