import 'package:flutter/material.dart';

class LayoutBuilderResponsive extends StatelessWidget {
  const LayoutBuilderResponsive({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        return Center(
          child: Container(
            width: 414,
            child: screen,
          ),
        );
      } else {
        return screen;
      }
    });
  }
}