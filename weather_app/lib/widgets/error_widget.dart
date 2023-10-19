import 'package:flutter/material.dart';

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Weather Loading failed 😔',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Try again later 🙂',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
