import 'package:bookclub/domain/models/book.dart';
import 'package:dio/dio.dart';

class BookReposiotry {
  BookReposiotry({required Dio remoteSource}) {
    _remoteSource = remoteSource;
  }

  late Dio _remoteSource;

  // Google Books Api
  final _apiHost = 'https://www.googleapis.com/books';

  Future<Book> getBookById(String id) async {
    String url = '$_apiHost/v1/volumes/$id';
    Response response = await _remoteSource.get(url);
    return Book.fromMap(response.data);
  }

  Future<List<Book>> getRecommendedBooks(String topic) async {
    String url = '$_apiHost/v1/volumes?q=$topic';
    Response response = await _remoteSource.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return Book.filterBrokeBooks(books);
  }

  Future<List<Book>> getTrendsBooks(String topic) async {
    String url = '$_apiHost/v1/volumes?q=$topic';
    Response response = await _remoteSource.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return Book.filterBrokeBooks(books);
  }

  Future<List<Book>> searchByName(String name) async {
    String url = '$_apiHost/v1/volumes?q=$name';
    Response response = await _remoteSource.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return Book.filterBrokeBooks(books);
  }
}
