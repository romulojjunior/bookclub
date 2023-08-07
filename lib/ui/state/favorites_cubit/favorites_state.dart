import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/models/writer.dart';
import 'package:flutter/material.dart';

@immutable
class FavoritesState {
  const FavoritesState({required this.isLoading, required this.books, required this.writers});

  final bool isLoading;
  final List<Book> books;
  final List<Writer> writers;

  copyWith({bool? isLoading, List<Book>? books, List<Writer>? writers}) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      books: books ?? this.books,
      writers: writers ?? this.writers,
    );
  }
}
