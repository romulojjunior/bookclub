import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/usecases/books/get_book_by_id.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_event.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc({required GetBookUC getBookUC}) : super(const BookDetailsState(isLoading: false)) {
    _getBookUC = getBookUC;

    on<LoadBookEvent>(_onLoadBook);
  }

  late GetBookUC _getBookUC;

  _onLoadBook(event, emitter) async {
    try {
      emitter(state.copyWith(book: null, isLoading: true));
      Book book = await _getBookUC.execute(event.id);
      emitter(state.copyWith(book: book, isLoading: false));
    } catch (e) {
      developer.log('BookDetailsBloc#_onLoadBook', error: e.toString());
      emitter(state.copyWith(isLoading: false, exception: e as Exception));
    }
  }
}
