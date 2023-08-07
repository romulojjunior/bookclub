import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/models/writer.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState(isLoading: false, books: [], writers: []));

  addBook(Book book) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books;
    books.add(book);
    emit(state.copyWith(isLoading: false, books: books));
  }

  removeBook(String bookId) {
    emit(state.copyWith(isLoading: true));
    List<Book> books = state.books;
    books.removeWhere((e) => e.id == bookId);
    emit(state.copyWith(isLoading: false, books: books));
  }

  addWriter(Writer writer) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers;
    writers.add(writer);
    emit(state.copyWith(isLoading: false, writers: writers));
  }

  removeWriter(int writerId) {
    emit(state.copyWith(isLoading: true));
    List<Writer> writers = state.writers;
    writers.removeWhere((e) => e.id == writerId);
    emit(state.copyWith(isLoading: false, writers: writers));
  }
}
