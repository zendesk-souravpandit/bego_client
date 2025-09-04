import 'package:becore/getx.dart';
import 'package:get_storage/get_storage.dart';

class BeStorageService extends GetxService {
  BeStorageService([this._boxName = 'demo.app']);

  static bool _initialized = false;

  late final GetStorage _box;
  final String _boxName;

  Future<BeStorageService> init() async {
    if (!_initialized) {
      await GetStorage.init(_boxName);
      _initialized = true;
    }
    _box = GetStorage(_boxName);
    return this;
  }

  T? read<T>(final String key, {final T? defaultValue}) {
    final value = _box.read<T>(key);
    return value ?? defaultValue;
  }

  Future<void> write<T>(final String key, final T value) async {
    await _box.write(key, value);
  }

  bool hasKey(final String key) => _box.hasData(key);

  Future<void> remove(final String key) async {
    await _box.remove(key);
  }

  void listen<T>(final String key, final void Function(T value) callback) {
    _box.listenKey(key, (final dynamic value) => callback(value as T));
  }

  Future<void> clear() async {
    await _box.erase();
  }
}
