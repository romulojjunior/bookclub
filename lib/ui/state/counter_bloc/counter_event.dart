import 'package:flutter/widgets.dart';

@immutable
abstract class CounterEvent {}

@immutable
class IncrementCounterEvent extends CounterEvent {
  IncrementCounterEvent(this.qty);

  final int qty;
}

@immutable
class DecrementCounterEvent extends CounterEvent {
  DecrementCounterEvent(this.qty);

  final int qty;
}
