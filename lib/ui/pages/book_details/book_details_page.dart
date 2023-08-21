import 'package:bookclub/domain/utils/html_utils.dart';
import 'package:bookclub/generated/l10n.dart';
import 'package:bookclub/ui/pages/book_details/widgets/book_panel_info.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_bloc.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_event.dart';
import 'package:bookclub/ui/state/book_details_bloc/book_details_state.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_loading_indicator.dart';
import 'package:bookclub/ui/widgets/ui_scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({required this.bookId, super.key});

  final String bookId;

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  static const double _containerMaxWidth = 500;
  static const double _largeScreenWidth = 1024;
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
    bool isLargeScreen = MediaQuery.of(context).size.width > _largeScreenWidth;

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

    List<Widget> body = [
      Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxWidth: _containerMaxWidth,
              minHeight: 500,
            ),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: state.book!.largeThumbnail ?? state.book!.thumbnail ?? '',
                progressIndicatorBuilder: (context, url, downloadProgress) => const UILoadingIndicator(),
              ),
            ),
          ),
          UIConditionalWidget(
              canShow: !isLargeScreen,
              onBuild: (context) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: _containerMaxWidth),
                  margin: const EdgeInsets.all(16),
                  child: const BookPanelInfo(),
                );
              }),
        ],
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: _containerMaxWidth),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              state.book!.title,
              style: const TextStyle(fontSize: 36),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                HtmlUtils.removeTags(state.book!.description ?? ''),
                maxLines: 20,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            UIConditionalWidget(
                canShow: isLargeScreen,
                onBuild: (context) {
                  return const BookPanelInfo();
                }),
          ],
        ),
      )
    ];

    return UIScaffold(
        title: S.of(context).bookDetails,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  if (isLargeScreen) {
                    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: body);
                  } else {
                    return Column(children: body);
                  }
                },
              ),
            ),
          ),
        ));
  }
}
