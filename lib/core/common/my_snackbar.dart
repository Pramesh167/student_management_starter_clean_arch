import 'package:flutter/material.dart';
import 'package:student_management_starter/app/navigator_key/navigator_key.dart';

showMySnackBar({
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(
    //we aready created this navigatory key in navigator_key.dart
    AppNavigator.navigatorKey.currentState!.context,
  ).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.green,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
