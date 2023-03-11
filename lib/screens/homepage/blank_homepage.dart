import 'package:flutter/material.dart';

class BlankHomePage extends StatelessWidget {
  const BlankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Click the search icon in the top right corner to start using the app',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
