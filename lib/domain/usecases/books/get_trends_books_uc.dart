import 'package:bookclub/domain/repositories/books_repository.dart';
import 'package:bookclub/domain/entities/book.dart';

class GetTrendsBooksUC {
  GetTrendsBooksUC({required BookReposiotry bookReposiotry}) {
    _bookReposiotry = bookReposiotry;
  }

  late BookReposiotry _bookReposiotry;

  Future<List<Book>> execute(String topic) {
    return _bookReposiotry.getTrendsBooks(topic);
  }
}
