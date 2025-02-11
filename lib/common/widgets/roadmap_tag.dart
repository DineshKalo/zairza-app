import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/controllers/roadmap/roadmap_controller.dart';
import 'package:zairza_app/screens/roadmap_view_page.dart';

class RoadMapTag extends StatefulWidget {
  final String text;
  final String roadmapId;
  const RoadMapTag({super.key, required this.text,  required this.roadmapId});

  @override
  State<RoadMapTag> createState() => _RoadMapTagState();
}

class _RoadMapTagState extends State<RoadMapTag> {
  final roadmapController _roadmapController = Get.put(roadmapController());

  //method to shorten the roadmap tag
  String shortenText(String text, int maxLength) {
    return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Fetch roadmap details by ID
        await _roadmapController.fetchRoadmapByID(widget.roadmapId);

        // Navigate to the roadmap view page
        if (_roadmapController.roadmap.isNotEmpty) {
          Get.to(() => RoadmapViewPage(
            url: _roadmapController.roadmap['links'] ?? '',
            name: _roadmapController.roadmap['name'] ?? 'Unknown',
          ));
        } else {
          Get.snackbar("Error", "Failed to load roadmap details.");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 2, color: Colors.black),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
          child: Text(
            shortenText(widget.text, 12),
            style: GlobalVariables.textMedium_14, // Use your custom style
          ),
        ),
      ),
    );
  }
}
