import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/models/book.dart';

class GetTrendsBooksUC {
  GetTrendsBooksUC({required BookReposiotry bookReposiotry}) {
    _bookReposiotry = bookReposiotry;
  }

  late BookReposiotry _bookReposiotry;

  Future<List<Book>> execute(String topic) {
    return _bookReposiotry.getTrendsBooks(topic);
  }
}
