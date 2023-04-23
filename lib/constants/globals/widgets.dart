import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content, {int? time}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    duration: Duration(seconds: time ?? 5),
  ));
}
