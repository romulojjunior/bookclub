import 'package:bookclub/domain/entities/user.dart';
import 'package:bookclub/ui/pages/home/widgets/settings_list_widget.dart';
import 'package:bookclub/ui/state/settings_cubit/settings_cubit.dart';
import 'package:bookclub/ui/widgets/ui_avatar_card.dart';
import 'package:bookclub/ui/widgets/ui_conditional_widget.dart';
import 'package:bookclub/ui/widgets/ui_page_header.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabSettings extends StatefulWidget {
  const TabSettings({required this.title, super.key});

  final String title;

  @override
  State<TabSettings> createState() => _TabSettingsState();
}

class _TabSettingsState extends State<TabSettings> {
  late SettingsCubit _settingsCubit;
  @override
  void initState() {
    _settingsCubit = BlocProvider.of<SettingsCubit>(context);
    _settingsCubit.loadAndCacheUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = ['Profile', 'Privacy', 'Logout'];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UIPageHeader(title: widget.title),
            UIConditionalWidget(
                canShow: _settingsCubit.state.user != null,
                onBuild: (context) {
                  User user = _settingsCubit.state.user!;
                  return Column(
                    children: [
                      UIAvatarCard(id: user.id!, imageUrl: user.avatarUrl, onPress: (id) {}),
                      Container(margin: const EdgeInsets.all(16), child: Text(user.name))
                    ],
                  );
                }),
            Container(constraints: const BoxConstraints(maxWidth: 400), child: SettingsList(items: options))
          ],
        ),
      ),
    );
  }
}
