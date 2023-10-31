import 'package:bookclub/domain/entities/book.dart';
import 'package:flutter/widgets.dart';

@immutable
class SearchState {
  const SearchState({required this.isLoading, required this.books});

  final bool isLoading;
  final List<Book> books;

  SearchState copyWith({bool? isLoading, List<Book>? books}) {
    return SearchState(isLoading: isLoading ?? this.isLoading, books: books ?? this.books);
  }
}
