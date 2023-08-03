import 'package:flutter/widgets.dart';

@immutable
class CounterState {
  final int value;

  const CounterState({required this.value});

  copyWith({int? value}) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
