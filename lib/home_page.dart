import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';
import 'tharal_ai_page.dart';
import 'trip_history_page.dart';
import 'start_trip_page.dart';
import 'language_page.dart'; // ✅ language selector page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    final List<Widget> pages = [
      _buildHomeContent(context, langProvider), // ✅ Header inside Home only
      Center(child: Text(langProvider.getText("Location Page"))),
      const TharalAIPage(),
      TripHistoryPage(),
      Center(child: Text(langProvider.getText("Analytics Page"))),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          pages[_selectedIndex],
          // Floating Start Trip button on Home page only
          if (_selectedIndex == 0)
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 6,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StartTripPage()),
                  );
                },
                child: Text(
                  langProvider.getText("Start Trip"),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: langProvider.getText("Home")),
          BottomNavigationBarItem(icon: const Icon(Icons.location_on_outlined), label: langProvider.getText("Location")),
          BottomNavigationBarItem(icon: const Icon(Icons.smart_toy_outlined), label: langProvider.getText("Tharal AI")),
          BottomNavigationBarItem(icon: const Icon(Icons.history), label: langProvider.getText("History")),
          BottomNavigationBarItem(icon: const Icon(Icons.analytics_outlined), label: langProvider.getText("Analytics")),
        ],
      ),
    );
  }

  // ✅ Top header will be used inside Home content only
  Widget _buildTopHeader(BuildContext context, LanguageProvider langProvider) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: 22,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${langProvider.getText("Hi")} User",
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/coin.jpg", height: 26, width: 26, fit: BoxFit.contain),
                  const SizedBox(width: 12),
                  const Icon(Icons.notifications_none, color: Colors.white, size: 26),
                  const SizedBox(width: 12),
                  // Language toggle button
                  IconButton(
                    icon: const Icon(Icons.language, color: Colors.white, size: 26),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LanguagePage(wordsToTranslate: [
                            "Hi", "Where are you want to go?", "Search", "Categories",
                            "See all", "Sights", "Adventure", "Culture", "Sea",
                            "Popular destination", "Recommendation", "Start Trip",
                            "Home", "Location", "Tharal AI", "History", "Analytics"
                          ]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            langProvider.getText("Where are you want to go?"),
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              hintText: langProvider.getText("Search"),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Home content includes top header + scrollable body
  Widget _buildHomeContent(BuildContext context, LanguageProvider langProvider) {
    return Column(
      children: [
        _buildTopHeader(context, langProvider),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(langProvider.getText("Categories"), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(langProvider.getText("See all"), style: const TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildCategoryChip(langProvider.getText("Sights")),
                      _buildCategoryChip(langProvider.getText("Adventure")),
                      _buildCategoryChip(langProvider.getText("Culture")),
                      _buildCategoryChip(langProvider.getText("Sea")),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildSectionTitle(context, langProvider.getText("Popular destination")),
                _buildHorizontalPlaces([
                  {"image": "assets/images/bekal_fort.jpg", "title": "Bekal Fort", "subtitle": "Kerala, India"},
                  {"image": "assets/images/thekkady.jpg", "title": "Thekkady", "subtitle": "Kerala, India"},
                  {"image": "assets/images/tea_estates.jpg", "title": "Tea Estates", "subtitle": "Kerala, India"},
                ]),
                _buildSectionTitle(context, langProvider.getText("Recommendation")),
                _buildHorizontalPlaces([
                  {"image": "assets/images/munnar.jpg", "title": "Munnar", "subtitle": "Kerala, India"},
                  {"image": "assets/images/k_lake.jpg", "title": "Kundala Lake", "subtitle": "Kerala, India"},
                  {"image": "assets/images/waynadu.jpg", "title": "Wayanad", "subtitle": "Kerala, India"},
                ]),
                const SizedBox(height: 140),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(label, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHorizontalPlaces(List<Map<String, String>> places) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(place["image"]!, height: 100, width: double.infinity, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(place["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(place["subtitle"]!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
