import 'package:flutter/material.dart';

class TharalAIPage extends StatefulWidget {
  const TharalAIPage({super.key});

  @override
  State<TharalAIPage> createState() => _TharalAIPageState();
}

class _TharalAIPageState extends State<TharalAIPage> {
  int _selectedIndex = 0; // 0 = Ask Tharal, 1 = Language Exchange

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top buttons
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() => _selectedIndex = 0);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 0 ? Colors.blue : Colors.grey[300],
                    foregroundColor: _selectedIndex == 0 ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Ask Tharal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _selectedIndex = 1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == 1 ? Colors.blue : Colors.grey[300],
                    foregroundColor: _selectedIndex == 1 ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Language Exchange"),
                ),
              ],
            ),
          ),

          // Switch screens
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                // 👉 Ask Tharal UI
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.mic, size: 120, color: Colors.blue),
                      SizedBox(height: 20),
                      Text("Your Kerala Travel Assistant", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),

                // 👉 Language Exchange UI
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.mic, size: 30),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              value: "English",
                              items: ["English", "Hindi", "Malayalam", "Tamil"].map((lang) {
                                return DropdownMenuItem(value: lang, child: Text(lang));
                              }).toList(),
                              onChanged: (val) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Icon(Icons.compare_arrows, size: 40, color: Colors.black),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.volume_up, size: 30),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              value: "Malayalam",
                              items: ["English", "Hindi", "Malayalam", "Tamil"].map((lang) {
                                return DropdownMenuItem(value: lang, child: Text(lang));
                              }).toList(),
                              onChanged: (val) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
