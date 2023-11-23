import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/usecases/search/search_book_by_name_uc.dart';
import 'package:bookclub/ui/state/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required SearchBookByNameUC searchBookByNameUC}) : super(SearchState.initialState()) {
    _searchBookByNameUC = searchBookByNameUC;
  }

  late SearchBookByNameUC _searchBookByNameUC;
  searchByName(String name) async {
    if (name.isEmpty) {
      _clearSearchResult();
    }

    if (name.length >= 3) {
      try {
        emit(state.copyWith(
          isLoading: true,
          searchQuery: () => name,
          exception: () => null,
        ));
        List<Book> books = await _searchBookByNameUC.execute(name);
        emit(state.copyWith(isLoading: false, books: books));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          exception: () => e as Exception,
        ));
      }
    }
  }

  _clearSearchResult() {
    emit(state.copyWith(books: []));
  }
}
