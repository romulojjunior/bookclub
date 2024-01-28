import 'package:bookclub/data/exceptions/connection_exception.dart';
import 'package:bookclub/data/exceptions/not_found_exception.dart';
import 'package:bookclub/di/app_di.dart';
import 'package:bookclub/domain/entities/book.dart';
import 'package:bookclub/domain/repositories/books_repository.dart';
import 'package:bookclub/mock/domain/repositories/book_repository_mock.dart';
import 'package:bookclub/ui/pages/home/tab_search.dart';
import 'package:bookclub/ui/state/search_cubit/search_cubit.dart';
import 'package:bookclub/ui/widgets/ui_app_tester.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late Widget application;

  const searchTextFiledKey = 'SearchTextFiled';
  const searchTabScope = 'SearchTabScope';

  BookRepositoryMock bookRepositoryMock = BookRepositoryMock();
  List<Book> bookSamples = Book.getSamples();

  group('SearchTab tests.', () {
    setUpAll(() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      // Dependecy Injection
      loadAppDI(GetIt.instance);
      GetIt.instance.pushNewScope(
          scopeName: searchTabScope,
          init: (getIt) {
            getIt.registerLazySingleton<BookReposiotry>(() => bookRepositoryMock);
          });
    });

    tearDownAll(() {
      GetIt.instance.popScopesTill(searchTabScope);
    });

    setUp(() {
      // State Management Injection
      application = MultiBlocProvider(providers: [
        BlocProvider(create: (context) => GetIt.I.get<SearchCubit>()),
      ], child: const UIAppTester(child: TabSearch(title: 'Search')));
    });

    testWidgets('When an user search for a title, it should display two book as result.', (tester) async {
      // Mocks
      when(() => bookRepositoryMock.searchByName(any())).thenAnswer((_) async => bookSamples);

      // Load application
      await tester.pumpWidget(application);

      // User's interaction
      Finder searchTextFieldFinder = find.byKey(const ValueKey(searchTextFiledKey));

      await tester.enterText(searchTextFieldFinder, 'Travel');

      await tester.testTextInput.receiveAction(TextInputAction.send);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text(bookSamples[0].title), findsOne);
      expect(find.text(bookSamples[1].title), findsOne);
    });

    testWidgets('When an user search for a title, it should display no result.', (tester) async {
      // Mocks
      const messageError = 'Search result returned no results.';
      when(() => bookRepositoryMock.searchByName(any())).thenThrow(NotFoundException(messageError));

      // Load application
      await tester.pumpWidget(application);

      // User's interaction
      Finder searchTextFieldFinder = find.byKey(const ValueKey(searchTextFiledKey));

      await tester.enterText(searchTextFieldFinder, 'jiwdhciduch  cihcdcdc');

      await tester.testTextInput.receiveAction(TextInputAction.send);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text('No results'), findsOne);
    });

    testWidgets('When there is no internet connection, it should display a message.', (tester) async {
      // Mocks
      when(() => bookRepositoryMock.searchByName(any())).thenThrow(ConnectionException());

      // Load application
      await tester.pumpWidget(application);

      // User's interaction
      Finder searchTextFieldFinder = find.byKey(const ValueKey(searchTextFiledKey));

      await tester.enterText(searchTextFieldFinder, 'Travel books');

      await tester.testTextInput.receiveAction(TextInputAction.send);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Validations
      expect(find.text('No Connection'), findsOne);
    });
  });
}
