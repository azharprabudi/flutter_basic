import 'package:flutter/material.dart';
import 'custom-text.dart';


class CustomBanner extends StatelessWidget {
  final int count;
  CustomBanner({ @required this.count });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: CustomText(count: this.count),
    );
  }
}