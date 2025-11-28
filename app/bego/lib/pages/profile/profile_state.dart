import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    required final String name,
    required final String email,
    required final String phone,
    required final List<String> orderHistory,
    required final bool isLoading,
    required final String? errorMessage,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState(
    name: 'John Doe',
    email: 'john@example.com',
    phone: '+91 9876543210',
    orderHistory: [
      'Order #001 - Decoration - ₹ 25,000 - Completed',
      'Order #002 - Catering - ₹ 15,000 - Completed',
      'Order #003 - Photography - ₹ 20,000 - Pending',
    ],
    isLoading: false,
    errorMessage: null,
  );

  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);
}
