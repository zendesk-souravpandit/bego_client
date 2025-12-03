import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcements_state.freezed.dart';
part 'announcements_state.g.dart';

@freezed
abstract class AnnouncementsState with _$AnnouncementsState {
  const factory AnnouncementsState({
    required String tenantId,
    required String businessId,
    @Default([]) List<String> announcements,
    @Default(false) bool isLoading,
    @Default(false) bool isCreating,
  }) = _AnnouncementsState;

  const AnnouncementsState._();

  factory AnnouncementsState.fromJson(final Map<String, dynamic> json) =>
      _$AnnouncementsStateFromJson(json);

  factory AnnouncementsState.initial({
    required final String tenantId,
    required final String businessId,
  }) {
    return AnnouncementsState(
      tenantId: tenantId,
      businessId: businessId,
      announcements: [],
      isLoading: false,
      isCreating: false,
    );
  }
}
