import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

@immutable
class BooksState {
  const BooksState(
      {required this.trends,
      required this.isTrendsLoading,
      required this.recommended,
      required this.isRecommendedLoading});

  final List<Book> trends;
  final bool isTrendsLoading;

  final List<Book> recommended;
  final bool isRecommendedLoading;

  copyWith({List<Book>? trends, bool? isTrendsLoading, List<Book>? recommended, bool? isRecommendedLoading}) {
    return BooksState(
      trends: trends ?? this.trends,
      isTrendsLoading: isTrendsLoading ?? this.isTrendsLoading,
      recommended: recommended ?? this.recommended,
      isRecommendedLoading: isRecommendedLoading ?? this.isRecommendedLoading,
    );
  }
}
