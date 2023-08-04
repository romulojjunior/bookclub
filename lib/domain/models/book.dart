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
      this.currencyCode});

  String? id;
  String title;
  List<String>? authors = [];
  String? description;
  String? language;

  String? smallThumbnail;
  String? thumbnail;
  String? previewLink;
  int? averageRating;
  int? ratingsCount;

  double? price;
  String? currencyCode;

  Map toMap() {
    Map data = {
      id: id,
      title: title,
      authors: authors,
      description: description,
      language: language,
      smallThumbnail: smallThumbnail,
      thumbnail: thumbnail,
      previewLink: previewLink,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      price: price,
      currencyCode: currencyCode,
    };

    return data;
  }

  static Book fromMap(Map<String, dynamic> data) {
    Book book = Book(title: data['volumeInfo']['title']);

    if (data.containsKey('volumeInfo')) {
      Map volumeInfo = data['volumeInfo'];
      book.id = data['id'];
      book.authors = (volumeInfo['authors'] as List).map((e) => e.toString()).toList();
      book.description = volumeInfo['description'];
      book.language = volumeInfo['language'];
      book.averageRating = volumeInfo['averageRating'];
      book.ratingsCount = volumeInfo['ratingsCount'];
      book.previewLink = volumeInfo['previewLink'];

      if (volumeInfo.containsKey('imageLinks')) {
        Map imageLinks = volumeInfo['imageLinks'];
        book.smallThumbnail = imageLinks['smallThumbnail'];
        book.thumbnail = imageLinks['thumbnail'];
      }
    }

    if (data.containsKey('saleInfo')) {
      Map saleInfo = data['saleInfo'];
      book.price = saleInfo['price'];
      book.currencyCode = saleInfo['currencyCode'];
    }

    return book;
  }
}
