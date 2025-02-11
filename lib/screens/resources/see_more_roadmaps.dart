import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/common/widgets/roadmap_tag.dart';

import '../../controllers/roadmap/roadmap_controller.dart';

class SeeMoreRoadMaps extends StatefulWidget {
  const SeeMoreRoadMaps({super.key});

  @override
  State<SeeMoreRoadMaps> createState() => _SeeMoreRoadMapsState();
}

class _SeeMoreRoadMapsState extends State<SeeMoreRoadMaps> {
  final roadmapListController _controller = Get.put(roadmapListController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.09451,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Roadmaps',
          style: GlobalVariables.textBold_24.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/resources_largeBG.png'),
                  Obx((){
                    if (_controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (_controller.roadmaps.isEmpty) {
                      return const Center(child: Text('No roadmaps found.'));
                    }
                    return SizedBox(
                      height: 20,
                      child: Padding(
                        padding: EdgeInsets.all(width*0.05581395348),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: width * 0.02325581395,
                          runSpacing: height * 0.01287553648,
                          children: _controller.roadmaps.map((roadmap) {
                            return RoadMapTag(
                              text: roadmap.name, // Display roadmap name
                              roadmapId: roadmap.id, // Pass roadmap ID for navigation
                            );
                          }).toList(),
                        ),
                      ),
                    );

                  })
                ],
              ),
            ],
          ),
        )

    );
  }
}
