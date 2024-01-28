import 'package:bookclub/di/app_di.dart';
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

void main() {
  late Widget application;

  group('Home tab.', () {
    setUpAll(() {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
      loadAppDI(GetIt.instance);
    });

    setUp(() {
      application = MultiBlocProvider(providers: [
        BlocProvider(create: (context) {
          return GetIt.I.get<BooksBloc>();
        }),
        BlocProvider(create: (context) {
          return GetIt.I.get<BookDetailsBloc>();
        }),
        BlocProvider(create: (context) {
          return GetIt.I.get<WritersCubit>();
        })
      ], child: const UIAppTester(child: TabHome(title: 'Home tab')));
    });

    testWidgets('It checks the "Writer" label is displyed.', (tester) async {
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Writer'), findsOneWidget);
    });

    testWidgets('It checks the "Trends" label is displyed.', (tester) async {
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Trends'), findsOneWidget);
    });

    testWidgets('It checks the "Recommended" label is displyed.', (tester) async {
      await tester.pumpWidget(application);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Recommended'), findsOneWidget);
    });
  });
}
