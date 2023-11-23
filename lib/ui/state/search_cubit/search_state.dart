import 'package:flutter/material.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

class SearchState {
  SearchState({required this.isLoading, required this.books, this.searchQuery, this.exception});

  final bool isLoading;
  final List<Book> books;
  final String? searchQuery;
  final Exception? exception;

  static SearchState initialState() {
    return SearchState(isLoading: false, books: []);
  }

  SearchState copyWith(
      {bool? isLoading, List<Book>? books, ValueGetter<String?>? searchQuery, ValueGetter<Exception?>? exception}) {
    return SearchState(
        isLoading: isLoading ?? this.isLoading,
        books: books ?? this.books,
        searchQuery: searchQuery != null ? searchQuery() : this.searchQuery,
        exception: exception != null ? exception() : this.exception);
  }
}
