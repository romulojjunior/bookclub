import 'package:flutter/material.dart';
import 'package:bookclub/domain/entities/book.dart';

class BooksState {
  BooksState(
      {required this.trends,
      required this.isTrendsLoading,
      required this.recommended,
      required this.isRecommendedLoading,
      this.exception});

  final List<Book> trends;
  final bool isTrendsLoading;

  final List<Book> recommended;
  final bool isRecommendedLoading;

  final Exception? exception;

  static BooksState initialState() {
    return BooksState(trends: [], isTrendsLoading: false, recommended: [], isRecommendedLoading: false);
  }

  BooksState copyWith(
      {List<Book>? trends,
      bool? isTrendsLoading,
      List<Book>? recommended,
      bool? isRecommendedLoading,
      ValueGetter<Exception?>? exception}) {
    return BooksState(
        trends: trends ?? this.trends,
        isTrendsLoading: isTrendsLoading ?? this.isTrendsLoading,
        recommended: recommended ?? this.recommended,
        isRecommendedLoading: isRecommendedLoading ?? this.isRecommendedLoading,
        exception: exception != null ? exception() : this.exception);
  }
}
