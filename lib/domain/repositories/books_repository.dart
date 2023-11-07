import 'package:bookclub/data/api/book_api.dart';
import 'package:bookclub/domain/entities/book.dart';

class BookReposiotry {
  BookReposiotry({required BookApi bookApi}) {
    _remoteSource = bookApi;
  }

  late BookApi _remoteSource;

  Future<Book> getBookById(String id) => _remoteSource.getBookById(id);

  Future<List<Book>> getRecommendedBooks(String topic) => _remoteSource.getRecommendedBooks(topic);

  Future<List<Book>> getTrendsBooks(String topic) => _remoteSource.getTrendsBooks(topic);

  Future<List<Book>> searchByName(String name) => _remoteSource.searchByName(name);
}
