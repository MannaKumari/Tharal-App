import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageProvider with ChangeNotifier {
  final translator = GoogleTranslator();
  String currentLanguageCode = "en"; // default English
  Map<String, String> translatedTexts = {};

  /// Define all the words/keys used across your app
  final List<String> allWords = [
    "Sign In",
    "Sign Up",
    "Email",
    "Password",
    "Confirm Password",
    "Home",
    "Start Trip",
    "Trip History",
    "Choose Language",
    "Logout",
    "Welcome Back",
    "Login to continue",
    "Don't I have an account",
    "Name",
    "Already Have Account",
    "Welcome",
    "Enter Your Details",
    "Ask Tharal",
  ];

  /// Change language for entire app
  Future<void> changeLanguage(String newLang, List<String> wordsToTranslate) async {
    currentLanguageCode = newLang;
    translatedTexts.clear();

    for (String word in allWords) {
      try {
        var translation = await translator.translate(word, to: newLang);
        translatedTexts[word] = translation.text;
      } catch (e) {
        translatedTexts[word] = word; // fallback if translation fails
      }
    }

    notifyListeners(); // rebuild widgets
  }

  /// Get translated text or fallback
  String getText(String word) {
    return translatedTexts[word] ?? word;
  }
}
