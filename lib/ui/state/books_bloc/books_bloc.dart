import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/ui/state/books_bloc/books_event.dart';
import 'package:bookclub/ui/state/books_bloc/books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required GetRecommendedBooksUC getRecommendedBooksUC,
    required GetTrendsBooksUC getTrendsBooksUC,
  }) : super(const BooksState(trends: [], isTrendsLoading: false, recommended: [], isRecommendedLoading: false)) {
    _getTrendsBooksUC = getTrendsBooksUC;
    _getRecommendedBooksUC = getRecommendedBooksUC;

    on<LoadTrendsBooksEvent>(_onLoadTrendsBooks);
    on<LoadRecommendedBooksEvent>(_onLoadRecommendedBooks);
  }

  late GetTrendsBooksUC _getTrendsBooksUC;
  late GetRecommendedBooksUC _getRecommendedBooksUC;

  loadInitialData() {
    add(LoadTrendsBooksEvent('travel'));
    add(LoadRecommendedBooksEvent('nature'));
  }

  _onLoadRecommendedBooks(event, emitter) async {
    emitter(state.copyWith(isRecommendedLoading: true));
    List<Book> books = await _getRecommendedBooksUC.execute(event.topic);
    emitter(state.copyWith(recommended: books, isRecommendedLoading: false));
  }

  _onLoadTrendsBooks(event, emitter) async {
    emitter(state.copyWith(isTrendsLoading: true));
    List<Book> books = await _getTrendsBooksUC.execute(event.topic);
    emitter(state.copyWith(trends: books, isTrendsLoading: false));
  }
}
