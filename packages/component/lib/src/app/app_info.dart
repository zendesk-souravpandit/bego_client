import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    required final String appName,
    required final String packageName,
    required final String version,
    required final String buildNumber,
    final String? buildSignature,
    final String? installerStore,
  }) = _AppInfo;

  factory AppInfo.fromJson(final Map<String, dynamic> json) => _$AppInfoFromJson(json);
}
