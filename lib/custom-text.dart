import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final int count;
  CustomText({ @required this.count });

  @override
  Widget build(BuildContext context) {
    return Text(this.count.toString());
  }
}