import "package:flutter/material.dart";

import "app_expansion_item_w.dart";

class AppExpandableListW extends StatelessWidget {
  final List<ExpansionListItem> list;
  final bool initiallyExpanded;

  const AppExpandableListW({
    super.key,
    required this.list,
    this.initiallyExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return AppExpansionItemW(
          initiallyExpanded: initiallyExpanded,
          item: list[index],
        );
      },
    );
  }
}
