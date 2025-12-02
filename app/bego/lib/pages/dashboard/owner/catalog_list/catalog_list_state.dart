import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_list_state.freezed.dart';
part 'catalog_list_state.g.dart';

@freezed
abstract class CatalogListState with _$CatalogListState {
  const factory CatalogListState({
    required String tenantId,
    required String businessId,
    @Default([]) List<String> items,
    @Default(false) bool isLoading,
  }) = _CatalogListState;

  const CatalogListState._();

  factory CatalogListState.fromJson(final Map<String, dynamic> json) =>
      _$CatalogListStateFromJson(json);

  factory CatalogListState.initial({
    required final String tenantId,
    required final String businessId,
  }) {
    return CatalogListState(
      tenantId: tenantId,
      businessId: businessId,
      items: [],
      isLoading: false,
    );
  }
}
