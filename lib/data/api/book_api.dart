import 'dart:io';
import 'dart:isolate';

import 'package:bookclub/data/exceptions/connection_exception.dart';
import 'package:bookclub/data/exceptions/internal_exception.dart';
import 'package:bookclub/data/exceptions/not_found_exception.dart';
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
    try {
      String url = '$_apiHost/v1/volumes/$id';
      Response response = await _httpClient.get(url);
      return Isolate.run(() => Book.fromMap(response.data));
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw ConnectionException();
      } else if (e.response?.statusCode == 404) {
        throw NotFoundException('BookApiError#getBookById: Book using id $id not found.}');
      } else {
        throw InternalException('BookApiError#getBookById: ${e.error}');
      }
    }
  }

  Future<List<Book>> getRecommendedBooks(String topic) async {
    try {
      String url = '$_apiHost/v1/volumes?q=$topic';
      Response response = await _httpClient.get(url);

      return Isolate.run(() {
        List<Book> books = (response.data['items'] as List).map((data) {
          return Book.fromMap(data);
        }).toList();

        return BookUtils.filterBrokeBooks(books);
      });
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw ConnectionException();
      } else if (e.response?.statusCode == 404) {
        throw NotFoundException('BookApiError#getRecommendedBooks: Recommended books using topic $topic not found.}');
      } else {
        throw InternalException('BookApiError#getRecommendedBooks: ${e.error}');
      }
    }
  }

  Future<List<Book>> getTrendsBooks(String topic) async {
    try {
      String url = '$_apiHost/v1/volumes?q=$topic';
      Response response = await _httpClient.get(url);

      return Isolate.run(() {
        List<Book> books = (response.data['items'] as List).map((data) {
          return Book.fromMap(data);
        }).toList();

        return BookUtils.filterBrokeBooks(books);
      });
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw ConnectionException();
      } else if (e.response?.statusCode == 404) {
        throw NotFoundException('BookApiError#getTrendsBooks: Trends books using topic $topic not found.}');
      } else {
        throw InternalException('BookApiError#getTrendsBooks: ${e.error}');
      }
    }
  }

  Future<List<Book>> searchByName(String name) async {
    try {
      String url = '$_apiHost/v1/volumes?q=$name';
      Response response = await _httpClient.get(url);

      if (response.data['totalItems'] == 0) {
        throw NotFoundException('BookApiError#searchByName: Books with name $name not found.}');
      }

      return Isolate.run(() {
        List<Book> books = (response.data['items'] as List).map((data) {
          return Book.fromMap(data);
        }).toList();

        return BookUtils.filterBrokeBooks(books);
      });
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw ConnectionException();
      } else if (e.response?.statusCode == 404) {
        throw NotFoundException('BookApiError#searchByName: Books with name $name not found.}');
      } else {
        throw InternalException('BookApiError#searchByName: ${e.error}');
      }
    }
  }
}
