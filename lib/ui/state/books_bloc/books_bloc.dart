import 'package:bookclub/domain/models/book.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/ui/state/books_bloc/books_event.dart';
import 'package:bookclub/ui/state/books_bloc/books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  late GetTrendsBooksUC _getTrendsBooksUC;
  late GetRecommendedBooksUC _getRecommendedBooksUC;

  BooksBloc({
    required GetRecommendedBooksUC getRecommendedBooksUC,
    required GetTrendsBooksUC getTrendsBooksUC,
  }) : super(const BooksState(trends: [], recommended: [])) {
    _getTrendsBooksUC = getTrendsBooksUC;
    _getRecommendedBooksUC = getRecommendedBooksUC;

    on<LoadTrendsBooksEvent>(_onLoadTrendsBooks);
    on<LoadRecommendedBooksEvent>(_onLoadRecommendedBooks);
  }

  loadInitialData() {
    add(LoadTrendsBooksEvent('travel'));
    add(LoadRecommendedBooksEvent('tales'));
  }

  _onLoadRecommendedBooks(event, emitter) async {
    List<Book> books = await _getRecommendedBooksUC.execute(event.topic);
    emitter(state.copyWith(recommended: books));
  }

  _onLoadTrendsBooks(event, emitter) async {
    List<Book> books = await _getTrendsBooksUC.execute(event.topic);
    emitter(state.copyWith(trends: books));
  }
}
