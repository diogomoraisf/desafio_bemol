import 'package:desafio_bemol/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int? elevation;
  final Color? backgroundColor;
  final Color? textIconColor;
  final IconData? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBackButton;
  final bool centerTitle;
  final Function()? destino;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    super.key,
    this.elevation = 0,
    this.backgroundColor = Colors.transparent,
    this.textIconColor,
    this.icon,
    this.title = '',
    this.height = kToolbarHeight,
    this.menuItem,
    this.hideBackButton = false,
    this.centerTitle = false,
    this.destino,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: menuItem,
      backgroundColor: backgroundColor,
      toolbarHeight: preferredSize.height,
      leading: hideBackButton
          ? null
          : icon == null
              ? const BackButton(
                  color: Colors.black,
                )
              : IconButton(
                  onPressed: () {
                    destino!();
                  },
                  icon: Icon(
                    icon,
                    size: 25,
                    color: Colors.black,
                  )),
      title: Text(
        title!,
        style: TextStyles.instance.baseTitleScreen,
      ),
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }
}
