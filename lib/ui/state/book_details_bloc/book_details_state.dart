import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

@immutable
class BookDetailsState {
  const BookDetailsState({this.book, required this.isLoading});

  final Book? book;
  final bool isLoading;

  copyWith({Book? book, bool? isLoading}) {
    return BookDetailsState(book: book ?? this.book, isLoading: isLoading ?? this.isLoading);
  }
}
