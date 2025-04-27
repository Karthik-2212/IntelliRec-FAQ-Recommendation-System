import 'package:flutter/material.dart';
import 'companies_page.dart';

class HomePage extends StatelessWidget {
  final double width;

  const HomePage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A0F2C), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'IntelliREC',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BFFF),
                    shadows: [
                      Shadow(
                        blurRadius: 50,
                        color: Color(0xFF00BFFF),
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      _normalText("Learn to "),
                      _neonWord("prepare"),
                      _normalText(" your dreams and "),
                      _neonWord("design"),
                      _normalText(" your future"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Last-minute preparation with FAQs from top tech companies.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompaniesPage(width: width),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00BFFF),
                    ),
                    child: const Text("Explore Questions"),
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Top Companies",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF00BFFF),
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 30,
                        color: Color(0xFF00BFFF),
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Top FAQ's from top recruiters.",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    _logoText("Google"),
                    _logoText("Meta"),
                    _logoText("Amazon"),
                    _logoText("Capgemini"),
                    _logoText("Oracle"),
                    _logoText("PayPal"),
                    _logoText("TCS"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static TextSpan _neonWord(String word) {
    return TextSpan(
      text: "$word ",
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00BFFF),
        shadows: [
          Shadow(
            blurRadius: 40,
            color: Color(0xFF00BFFF),
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }

  static TextSpan _normalText(String word) {
    return TextSpan(
      text: word,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  static Widget _logoText(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white10,
      ),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
