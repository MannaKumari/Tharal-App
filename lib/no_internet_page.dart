import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    List<String> words = ["No Internet Connection", "Please check your connection and try again"];

    return Scaffold(
      backgroundColor: const Color(0xFFE3E9FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Center Logo Instead of Icon
            Image.asset("assets/images/logo.jpg", height: 100, width: 100),
            const SizedBox(height: 20),

            Text(
              langProvider.getText("No Internet Connection"),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            Text(
              langProvider.getText("Please check your connection and try again"),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
