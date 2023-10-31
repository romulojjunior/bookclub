import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/entities/book.dart';

class SearchBookByNameUC {
  SearchBookByNameUC({required BookReposiotry bookReposiotry}) {
    _bookReposiotry = bookReposiotry;
  }

  late BookReposiotry _bookReposiotry;

  Future<List<Book>> execute(String name) {
    return _bookReposiotry.searchByName(name);
  }
}
