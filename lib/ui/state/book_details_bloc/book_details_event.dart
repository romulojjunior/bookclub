import 'package:flutter/widgets.dart';

@immutable
abstract class BookDetailsEvent {}

@immutable
class LoadBookEvent extends BookDetailsEvent {
  LoadBookEvent({required this.id});

  final String id;
}
