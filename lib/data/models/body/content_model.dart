import 'package:flutter/material.dart';

class ContentModel {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback? onPress;

  ContentModel({
    required this.title,
    this.onPress = _emptyFunction,
    required this.subtitle,
    required this.icon,
  });
  static void _emptyFunction() {}
}
