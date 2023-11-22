import 'package:bookclub/ui/utils/os_selector.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({required this.items, super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (_, __) => const material.Divider(),
        itemBuilder: (_, index) {
          String item = items[index];
          return OSSelector(
            android: material.ListTile(
              title: Text(item),
              selectedColor: material.Colors.transparent,
              onTap: () {},
            ),
            iOS: cupertino.CupertinoListTile(
                title: Text(item), backgroundColorActivated: material.Colors.transparent, onTap: () {}),
          );
        });
  }
}
