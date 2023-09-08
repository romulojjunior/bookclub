import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/usecases/books/get_book_by_id.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/domain/usecases/search/search_book_by_name_uc.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

loadAppDI(GetIt getIt) {
  loadHttpClient(getIt);
  loadRepositories(getIt);
  loadUsecases(getIt);
  loadBlocs(getIt);
  loadCubits(getIt);
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

  getIt.registerLazySingleton(() {
    return GetBookUC(bookReposiotry: getIt.get());
  });

  getIt.registerLazySingleton(() {
    return SearchBookByNameUC(bookReposiotry: getIt.get());
  });
}

loadBlocs(GetIt getIt) {
  getIt.registerFactory(() {
    BooksBloc booksBloc = BooksBloc(getTrendsBooksUC: getIt.get(), getRecommendedBooksUC: getIt.get());
    booksBloc.loadInitialData();
    return booksBloc;
  });

  getIt.registerFactory(() {
    return BookDetailsBloc(getBookUC: getIt.get());
  });
}

loadCubits(GetIt getIt) {
  getIt.registerFactory(() {
    return FavoritesCubit();
  });

  getIt.registerFactory(() {
    return SearchCubit(searchBookByNameUC: getIt.get());
  });
}
