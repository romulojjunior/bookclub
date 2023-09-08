import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/usecases/search/search_book_by_name_uc.dart';
import 'package:bookclub/ui/state/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required SearchBookByNameUC searchBookByNameUC})
      : super(const SearchState(isLoading: false, books: [])) {
    _searchBookByNameUC = searchBookByNameUC;
  }

  late SearchBookByNameUC _searchBookByNameUC;
  searchByName(String name) async {
    emit(state.copyWith(isLoading: true));
    List<Book> books = await _searchBookByNameUC.execute(name);
    emit(state.copyWith(isLoading: false, books: books));
  }

  clearSearchResult() {
    emit(state.copyWith(books: []));
  }
}