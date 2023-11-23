import 'package:bookclub/data/exceptions/not_found_exception.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/ui/state/books_bloc/books_event.dart';
import 'package:bookclub/ui/state/books_bloc/books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required GetRecommendedBooksUC getRecommendedBooksUC,
    required GetTrendsBooksUC getTrendsBooksUC,
  }) : super(BooksState.initialState()) {
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
    try {
      emitter(state.copyWith(isRecommendedLoading: true, exception: () => null));
      List<Book> books = await _getRecommendedBooksUC.execute(event.topic);
      emitter(state.copyWith(recommended: books, isRecommendedLoading: false));
    } on NotFoundException catch (_) {
      emitter(state.copyWith(recommended: [], isRecommendedLoading: false));
    } catch (e) {
      developer.log('BooksBloc#_onLoadRecommendedBooks', error: e.toString());
      emitter(state.copyWith(
        isRecommendedLoading: false,
        exception: () => e as Exception,
      ));
    }
  }

  _onLoadTrendsBooks(event, emitter) async {
    try {
      emitter(state.copyWith(
        isTrendsLoading: true,
        exception: () => null,
      ));
      List<Book> books = await _getTrendsBooksUC.execute(event.topic);
      emitter(state.copyWith(trends: books, isTrendsLoading: false));
    } on NotFoundException catch (_) {
      emitter(state.copyWith(trends: [], isTrendsLoading: false));
    } catch (e) {
      developer.log('BooksBloc#_onLoadTrendsBooks', error: e.toString());
      emitter(state.copyWith(
        isTrendsLoading: false,
        exception: () => e as Exception,
      ));
    }
  }
}
