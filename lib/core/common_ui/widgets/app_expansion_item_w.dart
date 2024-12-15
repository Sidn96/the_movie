import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:the_movie/config/consts/app_colors.dart";
import "package:the_movie/core/common_ui/common_ui.dart";

class AppExpansionItemW extends HookWidget {
  final ExpansionListItem item;
  final bool initiallyExpanded;
  const AppExpansionItemW({
    super.key,
    required this.item,
    this.initiallyExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(initiallyExpanded);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        dense: true,
        initiallyExpanded: initiallyExpanded,
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(left: 20.0),
        title: AppText(
          text: item.title,
          style: AppTextStyle.getH4TextStyle(),
        ),
        subtitle: item.subTitle != null ? AppText(text: item.subTitle!) : null,
        controlAffinity: ListTileControlAffinity.leading,
        leading: isExpanded.value
            ? const Icon(Icons.arrow_drop_down)
            : const Icon(Icons.arrow_forward_ios),
        onExpansionChanged: (v) {
          isExpanded.value = v;
        },
        children: item.expandedItem == null
            ? []
            : [
                ...List.generate(
                  item.expandedItem!.length,
                  (index) {
                    final expandedItem = item.expandedItem![index];
                    return ListTile(
                      contentPadding: const EdgeInsets.only(left: 20),
                      title: AppText(
                        text: expandedItem.title,
                        style: AppTextStyle.getH5TextStyle(),
                      ),
                      trailing: expandedItem.childTrailingWidgets != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: expandedItem.childTrailingWidgets!,
                            )
                          : null,
                    );
                  },
                ),
              ],
      ),
    );
  }
}

class ExpansionListItem {
  final String title;
  final String? subTitle;
  final List<ExpandedItem>? expandedItem;

  const ExpansionListItem({
    required this.title,
    this.subTitle,
    this.expandedItem,
  });
}

class ExpandedItem {
  final String title;
  final String? subTitle;
  final List<Widget>? childTrailingWidgets;

  ExpandedItem({
    required this.title,
    this.subTitle,
    this.childTrailingWidgets,
  });
}
