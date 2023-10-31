import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/entities/book.dart';

class GetBookUC {
  GetBookUC({required BookReposiotry bookReposiotry}) {
    _bookReposiotry = bookReposiotry;
  }

  late BookReposiotry _bookReposiotry;

  Future<Book> execute(String id) {
    return _bookReposiotry.getBookById(id);
  }
}
