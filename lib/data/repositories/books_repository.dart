import 'package:bookclub/domain/models/book.dart';
import 'package:dio/dio.dart';

class BookReposiotry {
  BookReposiotry({required Dio remoteSource}) {
    _remoteSource = remoteSource;
  }

  late Dio _remoteSource;

  // Get Google Books
  final _apiHost = 'https://www.googleapis.com/books';

  Future<List<Book>> getRecommendedBooks(String topic) async {
    String url = '$_apiHost/v1/volumes?q=$topic';
    Response response = await _remoteSource.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return books;
  }
}
