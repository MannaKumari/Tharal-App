import 'package:flutter/material.dart';

class PlannerDetailsPage extends StatefulWidget {
  const PlannerDetailsPage({super.key});

  @override
  State<PlannerDetailsPage> createState() => _PlannerDetailsPageState();
}

class _PlannerDetailsPageState extends State<PlannerDetailsPage> {
  String? modeOfTravel;
  String? coTravelers;
  String? tripPurpose;

  final List<String> travelModes = ["Bus", "Train", "Bike", "Cycle", "Walk", "Custom"];
  final List<String> coTravelerOptions = ["1", "2", "3", "4", "5", "Custom"];
  final List<String> tripPurposes = ["Studying", "Vacation", "Work", "Custom"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "PLANNER DETAILS",
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
          const SizedBox(height: 20),
          const Text(
            "Fill Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 40),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mode of Travel
                  const Text("Mode of travel *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    value: modeOfTravel,
                    items: travelModes.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => setState(() => modeOfTravel = val),
                  ),
                  const SizedBox(height: 25),

                  // Number of Co-travelers
                  const Text("Number of co-travelers *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    value: coTravelers,
                    items: coTravelerOptions.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => setState(() => coTravelers = val),
                  ),
                  const SizedBox(height: 25),

                  // Trip Purpose
                  const Text("Trip Purpose *", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    value: tripPurpose,
                    items: tripPurposes.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) => setState(() => tripPurpose = val),
                  ),
                ],
              ),
            ),
          ),

          // Confirm & Start Trip button
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
                // TODO: You can handle saving data here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Trip Started!")),
                );
              },
              child: const Text(
                "Confirm & Start Trip",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
