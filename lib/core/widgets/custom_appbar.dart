import 'package:flutter/material.dart';

import '../pallet.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final double barHeight;
  final String? title;
  bool hasBackButtonn;
  final Widget? bottomWidget;
  CustomAppbar(
      {Key? key, this.title, this.bottomWidget, this.hasBackButtonn = false, this.barHeight = 150})
      : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(barHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Pallet.appbar,
      automaticallyImplyLeading:hasBackButtonn,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      toolbarHeight: barHeight,
      flexibleSpace: bottomWidget ?? Container(),
    );
  }
}
