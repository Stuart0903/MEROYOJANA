import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class UNTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UNTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: dark ? UNColors.black : UNColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: UNColors.primary,
        labelColor: dark ? UNColors.white : UNColors.primary,
        unselectedLabelColor: UNColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UNDeviceUtils.getAppBarHeight());
}
