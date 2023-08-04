import 'package:bookclub/domain/models/book.dart';
import 'package:flutter/widgets.dart';

@immutable
class BooksState {
  final List<Book> trends;
  final List<Book> recommended;
  const BooksState({required this.trends, required this.recommended});

  copyWith({List<Book>? trends, List<Book>? recommended}) {
    return BooksState(
      trends: trends ?? this.trends,
      recommended: recommended ?? this.recommended,
    );
  }
}
