import 'package:flutter/material.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

@immutable
class BookDetailsState {
  const BookDetailsState({required this.isLoading, this.book, this.exception});

  final bool isLoading;
  final Book? book;
  final Exception? exception;

  BookDetailsState copyWith({bool? isLoading, Book? book, Exception? exception}) {
    return BookDetailsState(
        isLoading: isLoading ?? this.isLoading, book: book ?? this.book, exception: exception ?? this.exception);
  }
}
