import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

loadAppDI(GetIt getIt) {
  loadHttpClient(getIt);
  loadRepositories(getIt);
  loadUsecases(getIt);
}

loadHttpClient(GetIt getIt) {
  getIt.registerLazySingleton(() {
    return Dio();
  });
}

loadRepositories(GetIt getIt) {
  getIt.registerLazySingleton(() {
    return BookReposiotry(remoteSource: getIt.get());
  });
}

loadUsecases(GetIt getIt) {
  getIt.registerLazySingleton(() {
    return GetRecommendedBooksUC(bookReposiotry: getIt.get());
  });

  getIt.registerLazySingleton(() {
    return GetTrendsBooksUC(bookReposiotry: getIt.get());
  });
}
