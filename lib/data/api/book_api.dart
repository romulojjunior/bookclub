import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/utils/book_utils.dart';
import 'package:dio/dio.dart';

class BookApi {
  BookApi({required Dio httpClient}) {
    _httpClient = httpClient;
  }

  late Dio _httpClient;

  // Google Books Api
  final _apiHost = 'https://www.googleapis.com/books';

  Future<Book> getBookById(String id) async {
    String url = '$_apiHost/v1/volumes/$id';
    Response response = await _httpClient.get(url);
    return Book.fromMap(response.data);
  }

  Future<List<Book>> getRecommendedBooks(String topic) async {
    String url = '$_apiHost/v1/volumes?q=$topic';
    Response response = await _httpClient.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return BookUtils.filterBrokeBooks(books);
  }

  Future<List<Book>> getTrendsBooks(String topic) async {
    String url = '$_apiHost/v1/volumes?q=$topic';
    Response response = await _httpClient.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return BookUtils.filterBrokeBooks(books);
  }

  Future<List<Book>> searchByName(String name) async {
    String url = '$_apiHost/v1/volumes?q=$name';
    Response response = await _httpClient.get(url);

    List<Book> books = (response.data['items'] as List).map((data) {
      return Book.fromMap(data);
    }).toList();

    return BookUtils.filterBrokeBooks(books);
  }
}
