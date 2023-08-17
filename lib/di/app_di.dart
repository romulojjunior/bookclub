import 'package:bookclub/data/repositories/books_repository.dart';
import 'package:bookclub/domain/usecases/books/get_recommened_books_uc.dart';
import 'package:bookclub/domain/usecases/books/get_trends_books_uc.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/favorites_cubit/favorites_cubit.dart';
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
}

loadBlocs(GetIt getIt) {
  getIt.registerFactory(() {
    BooksBloc booksBloc = BooksBloc(getTrendsBooksUC: getIt.get(), getRecommendedBooksUC: getIt.get());
    booksBloc.loadInitialData();
    return booksBloc;
  });
}

loadCubits(GetIt getIt) {
  getIt.registerFactory(() {
    return FavoritesCubit();
  });
}
