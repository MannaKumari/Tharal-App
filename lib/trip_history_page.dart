import 'package:flutter/material.dart';

class TripHistoryPage extends StatelessWidget {
  TripHistoryPage({super.key});

  final List<Map<String, dynamic>> trips = [
    {
      "id": "2025001",
      "from": "Kochi",
      "to": "Trivandrum",
      "duration": "4h 20m",
      "distance": "205 km",
      "date": "30 Aug",
      "mode": "Car",
      "status": "completed",
      "co2": "2.1 kg saved",
      "color": Colors.blue.shade100,
    },
    {
      "id": "2025002",
      "from": "Calicut",
      "to": "Kochi",
      "duration": "3h 30m",
      "distance": "155 km",
      "date": "28 Aug",
      "mode": "Bus",
      "status": "completed",
      "co2": "1.6 kg saved",
      "color": Colors.blue.shade100,
    },
    {
      "id": "2025003",
      "from": "Thrissur",
      "to": "Palakkad",
      "duration": "2h 50m",
      "distance": "195 km",
      "date": "25 Aug",
      "mode": "Train",
      "status": "completed",
      "co2": "3.2 kg saved",
      "color": Colors.blue.shade100,
    },
    {
      "id": "2025004",
      "from": "Kottayam",
      "to": "Alappuzha",
      "duration": "6h 20m",
      "distance": "300 km",
      "date": "21 Aug",
      "mode": "Car",
      "status": "completed",
      "co2": "2.8 kg saved",
      "color": Colors.blue.shade100,
    },
    {
      "id": "2025005",
      "from": "Thekkady",
      "to": "Munnar",
      "duration": "1h 10m",
      "distance": "105 km",
      "date": "20 Aug",
      "mode": "Bus",
      "status": "completed",
      "co2": "1.2 kg saved",
      "color": Colors.blue.shade100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip History"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return GestureDetector(
            onTap: () {
              _showTripDetails(context, trip);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: trip["color"],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Route + Trip ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${trip["from"]} → ${trip["to"]}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(trip["id"],
                            style: const TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Duration + Distance + Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(trip["duration"]),
                      Text(trip["distance"]),
                      Text(trip["date"]),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // 🔹 Trip Details Popup (Bottom Sheet)
  void _showTripDetails(BuildContext context, Map<String, dynamic> trip) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trip Id: ${trip["id"]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 10),
              const Text("Trip Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const Divider(),
              _buildDetailRow("Route", "${trip["from"]} → ${trip["to"]}"),
              _buildDetailRow("Mode", trip["mode"]),
              _buildDetailRow("Duration", trip["duration"]),
              _buildDetailRow("Distance", trip["distance"]),
              _buildDetailRow("Status", trip["status"]),
              _buildDetailRow("CO₂ Impact", trip["co2"]),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}
