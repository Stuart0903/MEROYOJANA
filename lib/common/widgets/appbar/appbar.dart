import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class UNAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UNAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.showBackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
    this.onPressed,
  });

  final Widget? title;
  final Widget? subtitle;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UNSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
          onPressed: onPressed ??
                  () {
                // If onPressed is not provided, default to Get.back()
                Get.back();
              },
          icon: const Icon(Iconsax.arrow_left),
        )
            : leadingIcon != null
            ? IconButton(
          onPressed: leadingOnPressed,
          icon: Icon(leadingIcon),
        )
            : null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) title!,
            if (subtitle != null) subtitle!,
          ],
        ),
        actions: action,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UNDeviceUtils.getAppBarHeight());
}