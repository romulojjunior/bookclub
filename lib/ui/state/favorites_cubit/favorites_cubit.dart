import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(isLoading: false, books: [], writers: []));

  bool isFavoriteBook(Book book) {
    return state.books.where((e) => e.id == book.id).isNotEmpty;
  }

  addBook(Book book) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books.toList();
    books.add(book);
    emit(state.copyWith(isLoading: false, books: books));
  }

  removeBook(String bookId) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books.toList();
    books.removeWhere((e) => e.id == bookId);
    emit(state.copyWith(isLoading: false, books: books));
  }

  bool isFavoriteWriter(Writer writer) {
    return state.writers.where((e) => e.id == writer.id).isNotEmpty;
  }

  addWriter(Writer writer) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers.toList();
    writers.add(writer);
    emit(state.copyWith(isLoading: false, writers: writers));
  }

  removeWriter(int writerId) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers.toList();
    writers.removeWhere((e) => e.id == writerId);
    emit(state.copyWith(isLoading: false, writers: writers));
  }
}
