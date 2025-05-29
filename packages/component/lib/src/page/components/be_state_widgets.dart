import 'package:beui/common.dart' show emptyWidget;
import 'package:flutter/material.dart';

abstract class StateWidget<T> extends StatelessWidget {
  const StateWidget({super.key});
}

class LoadingStateWidget<T> extends StateWidget<T> {
  const LoadingStateWidget({super.key});

  @override
  Widget build(final BuildContext context) => const Center(child: CircularProgressIndicator());
}

class ErrorStateWidget<T> extends StateWidget<T> {
  const ErrorStateWidget({super.key, required this.error, this.state});
  final T? state;
  final dynamic error;

  @override
  Widget build(final BuildContext context) => Center(child: Text('Error: $error'));
}

class EmptyStateWidget<T> extends StateWidget<T> {
  const EmptyStateWidget({super.key});

  @override
  Widget build(final BuildContext context) => const Center(child: Text('No Data Found'));
}

class SuccessStateWidget<T> extends StateWidget<T> {
  const SuccessStateWidget({super.key, required this.data});
  final T data;

  @override
  Widget build(final BuildContext context) {
    if (data is String) {
      return Text(data as String);
    }
    return const Text('Success');
  }
}

class CustomStateWidget<T> extends StateWidget<T> {
  const CustomStateWidget({super.key, this.data});

  final T? data;

  @override
  Widget build(final BuildContext context) => emptyWidget;
}
