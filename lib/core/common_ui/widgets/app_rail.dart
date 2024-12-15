import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';

class AppRail extends HookWidget {
  const AppRail({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    required this.showExpansionIcon,
    this.expansionIconBgColor,
    required this.expansionIcon,
    required this.collapseIcon,
    required this.child,
    this.leading,
    this.trailing,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final List<NavigationRailDestination> destinations;
  final bool showExpansionIcon;
  final Color? expansionIconBgColor;
  final Widget expansionIcon;
  final Widget collapseIcon;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavigationRail(
          extended: isExpanded.value,
          minWidth: 40,
          labelType: NavigationRailLabelType.none,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations,
          leading: leading,
          trailing: Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: trailing ?? const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        if (showExpansionIcon) ...[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: expansionIconBgColor ??
                    Theme.of(context).navigationRailTheme.indicatorColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: isExpanded.value ? collapseIcon : expansionIcon,
              ),
            ),
          ),
        ],
        const SizedBox(width: AppSpacing.height10),
        child,
      ],
    );
  }
}
