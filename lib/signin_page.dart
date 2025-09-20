import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'language_page.dart'; // ✅ import your existing Language Page

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    // ✅ List of words used on this page that need translations
    final List<String> wordsToTranslate = [
      "Welcome Back",
      "Login to continue",
      "Email",
      "Password",
      "Sign In",
      "Don't have an account?",
      "Sign Up",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE3E9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.black),
            onPressed: () {
              // ✅ Pass wordsToTranslate when opening LanguagePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      LanguagePage(wordsToTranslate: wordsToTranslate),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Center Logo
            Center(
              child: Image.asset(
                "assets/images/logo.jpg",
                height: 90,
                width: 90,
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              langProvider.getText("Welcome Back"),
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              langProvider.getText("Login to continue"),
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // Email
            TextField(
              decoration: InputDecoration(
                labelText: langProvider.getText("Email"),
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Password
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: langProvider.getText("Password"),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Sign In Button
            ElevatedButton(
              onPressed: () {
                // ✅ After successful login → Go to HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                langProvider.getText("Sign In"),
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),

            // Don't have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(langProvider.getText("Don't have an account?")),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    langProvider.getText("Sign Up"),
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
