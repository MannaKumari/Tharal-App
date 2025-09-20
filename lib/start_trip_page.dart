import 'package:flutter/material.dart';
import 'planner_details_page.dart';

class StartTripPage extends StatefulWidget {
  const StartTripPage({super.key});

  @override
  State<StartTripPage> createState() => _StartTripPageState();
}

class _StartTripPageState extends State<StartTripPage> {
  // List of destinations
  final List<Map<String, String>> destinations = [
    {"name": "Alleppey", "place": "Alappuzha"},
    {"name": "Bekal Fort", "place": "Kasaragod"},
    {"name": "Tea Estates", "place": "Idukki"},
    {"name": "Trivandrum", "place": "Thiruvananthapuram"},
    {"name": "Kundala Lake", "place": "Idukki"},
    {"name": "Munnar", "place": "Idukki"},
    {"name": "Thekkady", "place": "Idukki"},
    {"name": "Kovalam Beach", "place": "Thiruvananthapuram"},
    {"name": "Wayanad", "place": "Wayanad"},
    {"name": "Varkala Beach", "place": "Thiruvananthapuram"},
    {"name": "Poovar Island", "place": "Thiruvananthapuram"},
  ];

  // To track selected places
  final Map<String, bool> selected = {};

  @override
  void initState() {
    super.initState();
    for (var d in destinations) {
      selected[d["name"]!] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "START TRIP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final place = destinations[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                    ],
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    title: Text(
                      place["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(place["place"]!),
                    trailing: Checkbox(
                      value: selected[place["name"]!],
                      onChanged: (val) {
                        setState(() {
                          selected[place["name"]!] = val!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Continue button
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PlannerDetailsPage()),
                );
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
