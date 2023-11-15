import 'package:flutter/widgets.dart';

@immutable
abstract class BooksEvent {}

@immutable
class LoadTrendsBooksEvent extends BooksEvent {
  LoadTrendsBooksEvent(this.topic);

  final String topic;
}

@immutable
class LoadRecommendedBooksEvent extends BooksEvent {
  LoadRecommendedBooksEvent(this.topic);

  final String topic;
}

@immutable
class EnableBooksUIErrorEvent extends BooksEvent {}

@immutable
class DisableBooksUIErrorEvent extends BooksEvent {}
