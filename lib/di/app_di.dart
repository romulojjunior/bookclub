import 'package:bookclub/data/api/book_api.dart';
import 'package:bookclub/data/api/writer_api.dart';
import 'package:bookclub/domain/repositories/books_repository.dart';
import 'package:bookclub/domain/repositories/writer_repository.dart';
import 'package:bookclub/domain/usecases/books/get_book_by_id.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/domain/usecases/search/search_book_by_name_uc.dart';
import 'package:bookclub/domain/usecases/writers/get_writers.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:bookclub/ui/state/settings_cubit/settings_cubit.dart';
import 'package:bookclub/ui/state/writers_cubit/writers_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

loadAppDI(GetIt getIt) {
  loadHttpClient(getIt);
  loadApi(getIt);
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

loadApi(GetIt getIt) {
  getIt.registerLazySingleton(() {
    return BookApi(httpClient: getIt.get());
  });

  getIt.registerLazySingleton(() {
    return WriterApi();
  });
}

loadRepositories(GetIt getIt) {
  getIt.registerLazySingleton(() {
    return BookReposiotry(bookApi: getIt.get());
  });

  getIt.registerLazySingleton(() {
    return WriterRepository(writerApi: getIt.get());
  });
}

loadUsecases(GetIt getIt) {
  // Books
  getIt.registerFactory(() {
    return GetRecommendedBooksUC(bookReposiotry: getIt.get());
  });

  getIt.registerFactory(() {
    return GetTrendsBooksUC(bookReposiotry: getIt.get());
  });

  getIt.registerFactory(() {
    return GetBookUC(bookReposiotry: getIt.get());
  });

  getIt.registerFactory(() {
    return SearchBookByNameUC(bookReposiotry: getIt.get());
  });

  // Writers
  getIt.registerLazySingleton(() {
    return GetWritersUC(writerReposiotry: getIt.get());
  });
}

loadBlocs(GetIt getIt) {
  getIt.registerLazySingleton(() {
    BooksBloc booksBloc = BooksBloc(getTrendsBooksUC: getIt.get(), getRecommendedBooksUC: getIt.get());
    booksBloc.loadInitialData();
    return booksBloc;
  });

  getIt.registerLazySingleton(() {
    return BookDetailsBloc(getBookUC: getIt.get());
  });
}

loadCubits(GetIt getIt) {
  getIt.registerLazySingleton(() {
    WritersCubit writersCubit = WritersCubit(getWritersUC: getIt.get());
    writersCubit.loadInitialData();
    return writersCubit;
  });

  getIt.registerLazySingleton(() {
    return FavoritesCubit();
  });

  getIt.registerLazySingleton(() {
    return SearchCubit(searchBookByNameUC: getIt.get());
  });

  getIt.registerLazySingleton(() {
    return SettingsCubit();
  });
}
