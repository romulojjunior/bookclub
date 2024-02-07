import 'package:bookclub/di/app_di.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/entities/writer.dart';
import 'package:bookclub/domain/repositories/books_repository.dart';
import 'package:bookclub/domain/repositories/writer_repository.dart';
import 'package:bookclub/mock/domain/repositories/book_repository_mock.dart';
import 'package:bookclub/mock/domain/repositories/writer_repository_mock.dart';
import 'package:bookclub/ui/pages/home/tab_home.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/books_bloc/books_bloc.dart';
import 'package:bookclub/ui/state/writers_cubit/writers_cubit.dart';
import 'package:bookclub/ui/widgets/ui_app_tester.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late Widget application;

  const homeTabScope = 'HomeTabScope';

  BookRepositoryMock bookRepositoryMock = BookRepositoryMock();
  WriterRepositoryMock writerRepositoryMock = WriterRepositoryMock();

  List<Book> bookSamples = Book.getSamples();
  List<Writer> writerSamples = Writer.getSamples();

  group('HomeTab tests.', () {
    setUpAll(() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Dependecy Injection
      loadAppDI(GetIt.instance);
      GetIt.instance.pushNewScope(
          scopeName: homeTabScope,
          init: (getIt) {
            getIt.registerLazySingleton<BookReposiotry>(() => bookRepositoryMock);
            getIt.registerLazySingleton<WriterRepository>(() => writerRepositoryMock);
          });

      // Mocks
      when(() => writerRepositoryMock.getWriters()).thenAnswer((_) async => writerSamples);
      when(() => bookRepositoryMock.getRecommendedBooks(any())).thenAnswer((_) async => bookSamples);
      when(() => bookRepositoryMock.getTrendsBooks(any())).thenAnswer((_) async => bookSamples);
    });

    tearDownAll(() {
      GetIt.instance.popScopesTill(homeTabScope);
    });

    setUp(() {
      // State Management Injection
      application = MultiBlocProvider(providers: [
        BlocProvider(create: (context) => GetIt.I.get<BooksBloc>()),
        BlocProvider(create: (context) => GetIt.I.get<BookDetailsBloc>()),
        BlocProvider(create: (context) => GetIt.I.get<WritersCubit>())
      ], child: const UIAppTester(child: TabHome()));
    });

    testWidgets('It checks the "Writer" label is displyed.', (tester) async {
      // Load application
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text('Writer'), findsOneWidget);
    });

    testWidgets('It checks the "Trends" label is displyed.', (tester) async {
      // Load application
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text('Trends'), findsOneWidget);
    });

    testWidgets('It checks the "Recommended" label is displyed.', (tester) async {
      // Load application
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text('Recommended'), findsOneWidget);
    });
  });
}
