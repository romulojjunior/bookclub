import 'package:flutter/material.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

class BookDetailsState {
  BookDetailsState({required this.isLoading, this.book, this.exception});

  final bool isLoading;
  final Book? book;
  final Exception? exception;

  static BookDetailsState initialState() {
    return BookDetailsState(isLoading: true);
  }

  BookDetailsState copyWith({bool? isLoading, ValueGetter<Book?>? book, ValueGetter<Exception?>? exception}) {
    return BookDetailsState(
        isLoading: isLoading ?? this.isLoading,
        book: book != null ? book() : this.book,
        exception: exception != null ? exception() : this.exception);
  }
}
