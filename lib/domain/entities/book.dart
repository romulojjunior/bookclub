class Book {
  Book(
      {required this.title,
      this.id,
      this.authors,
      this.description,
      this.language,
      this.smallThumbnail,
      this.thumbnail,
      this.previewLink,
      this.averageRating,
      this.ratingsCount,
      this.price,
      this.currencyCode,
      this.pageQuantity});

  String? id;
  String title;
  List<String>? authors = [];
  String? description;
  String? language;

  String? smallThumbnail;
  String? thumbnail;
  String? largeThumbnail;
  String? previewLink;
  double? averageRating;
  int? ratingsCount;
  int? pageQuantity;

  double? price;
  String? currencyCode;

  Map toMap() {
    Map object = {
      id: id,
      title: title,
      authors: authors,
      description: description,
      language: language,
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
      largeThumbnail: largeThumbnail,
      previewLink: previewLink,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      price: price,
      currencyCode: currencyCode,
      pageQuantity: pageQuantity,
    };

    return object;
  }

  static Book fromMap(Map<String, dynamic> object) {
    Book book = Book(title: object['volumeInfo']['title']);

    if (object.containsKey('volumeInfo')) {
      Map volumeInfo = object['volumeInfo'];
      book.id = object['id'];
      if (volumeInfo.containsKey('authors')) {
        book.authors = (volumeInfo['authors'] as List).map((e) => e.toString()).toList();
      }
      book.description = volumeInfo['description'];
      book.language = volumeInfo['language'];
      book.previewLink = volumeInfo['previewLink'];

      book.ratingsCount = volumeInfo['ratingsCount'] ?? 0;
      book.pageQuantity = volumeInfo['pageCount'] ?? 0;

      if (volumeInfo.containsKey('averageRating') == true) {
        try {
          book.averageRating = double.parse('${volumeInfo['averageRating']}');
        } catch (_) {
          book.averageRating = 0.0;
        }
      }

      if (volumeInfo.containsKey('imageLinks')) {
        Map imageLinks = volumeInfo['imageLinks'];
        book.smallThumbnail = imageLinks['smallThumbnail'];
        book.thumbnail = imageLinks['thumbnail'];
        book.largeThumbnail = imageLinks['large'];
      }
    }

    if (object.containsKey('saleInfo')) {
      Map saleInfo = object['saleInfo'];
      book.price = saleInfo['price'];
      book.currencyCode = saleInfo['currencyCode'];
    }

    return book;
  }
}
