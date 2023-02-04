// ignore_for_file: file_names

import 'package:flutter/material.dart';

Color gainColor(BuildContext context, double percentage) {
  if (percentage >= 0.50) {
    return Theme.of(context).primaryColor;
  } else if (percentage >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
