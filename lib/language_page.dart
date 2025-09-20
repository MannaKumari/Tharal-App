import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';

class LanguagePage extends StatelessWidget {
  final List<String> wordsToTranslate;

  const LanguagePage({super.key, required this.wordsToTranslate});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);

    List<Map<String, String>> supportedLangs = [
      {"code": "en", "name": "English"},
      {"code": "hi", "name": "Hindi"},
      {"code": "fr", "name": "French"},
      {"code": "es", "name": "Spanish"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Language")),
      body: ListView.builder(
        itemCount: supportedLangs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(supportedLangs[index]["name"]!),
            onTap: () async {
              await langProvider.changeLanguage(supportedLangs[index]["code"]!, wordsToTranslate);
              Navigator.pop(context); // back to page
            },
          );
        },
      ),
    );
  }
}
