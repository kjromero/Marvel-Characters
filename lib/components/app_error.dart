import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;
  const AppError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != message && message.isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
