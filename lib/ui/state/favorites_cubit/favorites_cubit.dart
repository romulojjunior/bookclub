import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/models/writer.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(isLoading: false, books: [], writers: []));

  favoriteBook(Book book) {
    bool isFavorited = state.books.where((e) => e.id == book.id).isNotEmpty;

    if (isFavorited) {
      _removeBook(book.id!);
    } else {
      _addBook(book);
    }
  }

  _addBook(Book book) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books.toList();
    books.add(book);
    emit(state.copyWith(isLoading: false, books: books));
  }

  _removeBook(String bookId) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books.toList();
    books.removeWhere((e) => e.id == bookId);
    emit(state.copyWith(isLoading: false, books: books));
  }

  favoriteWriter(Writer writer) {
    bool isFavorited = state.writers.where((e) => e.id == writer.id).isNotEmpty;

    if (isFavorited) {
      _removeWriter(writer.id!);
    } else {
      _addWriter(writer);
    }
  }

  _addWriter(Writer writer) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers.toList();
    writers.add(writer);
    emit(state.copyWith(isLoading: false, writers: writers));
  }

  _removeWriter(int writerId) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers.toList();
    writers.removeWhere((e) => e.id == writerId);
    emit(state.copyWith(isLoading: false, writers: writers));
  }
}
