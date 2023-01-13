import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListtile extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget? trailing;
  final Widget? leading;

  const ProductListtile({
    Key? key,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: trailing,
    );
  }
}
