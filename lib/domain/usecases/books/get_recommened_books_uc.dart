import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/entities/book.dart';

class GetRecommendedBooksUC {
  GetRecommendedBooksUC({required BookReposiotry bookReposiotry}) {
    _bookReposiotry = bookReposiotry;
  }

  late BookReposiotry _bookReposiotry;

  Future<List<Book>> execute(String topic) {
    return _bookReposiotry.getRecommendedBooks(topic);
  }
}
