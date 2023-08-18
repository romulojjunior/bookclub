import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_event.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_state.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
// import 'package:flutter/cupertino.dart' as cupertino;
// import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({required this.bookId, super.key});

  final String bookId;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  late BookDetailsBloc _bookDetailsBloc;
  @override
  void initState() {
    super.initState();
    _bookDetailsBloc = context.read<BookDetailsBloc>();
    _bookDetailsBloc.add(LoadBookEvent(id: widget.bookId));
  }

  @override
  Widget build(BuildContext context) {
    BookDetailsState state = context.watch<BookDetailsBloc>().state;

    if (state.isLoading) {
      return UIScaffold(
          title: S.of(context).bookDetails,
          child: const SafeArea(
            child: Center(
              child: UILoadingIndicator(),
            ),
          ));
    }

    if (state.book == null) {
      return UIScaffold(
          title: S.of(context).bookDetails,
          child: SafeArea(
            child: Center(
              child: Text(S.of(context).bookNotFound),
            ),
          ));
    }

    return UIScaffold(
        title: S.of(context).bookDetails,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 450,
                    child: Image.network(
                      state.book!.largeThumbnail ?? state.book!.thumbnail ?? '',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    state.book!.title,
                    style: const TextStyle(fontSize: 36),
                  ),
                  Text(
                    state.book!.description ?? '',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
