import 'package:bookclub/domain/entities/book.dart';

class BookUtils {
  static List<Book> filterBrokeBooks(List<Book> books) {
    return books.where((book) {
      if (book.largeThumbnail?.isEmpty == true) {
        return false;
      }

      if (book.thumbnail?.isEmpty == true) {
        return false;
      }

      if (book.description?.isEmpty == true) {
        return false;
      }

      if (isInBlackList(book)) {
        return false;
      }

      return true;
    }).toList();
  }

  static bool isInBlackList(Book book) {
    if (book.title.toLowerCase() == 'travel by design') {
      return true;
    }

    if (book.title.toLowerCase() == 'nature') {
      return true;
    }

    return false;
  }
}
