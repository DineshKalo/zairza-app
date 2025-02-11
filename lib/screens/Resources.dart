import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/common/widgets/blog_card.dart';
import 'package:zairza_app/common/widgets/roadmap_tag.dart';
import 'package:zairza_app/common/widgets/session_tag.dart';
import 'package:zairza_app/common/widgets/video_card.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/controllers/roadmap/roadmap_controller.dart';

import '../controllers/blogs/blog_controller.dart';
import '../controllers/session/session_controller.dart';
import '../controllers/video/video_controller.dart';

class ResourcesPage extends StatefulWidget {

    const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final BlogController _blogController = Get.put(BlogController());
  final roadmapListController _roadmapController = Get.put(roadmapListController());
  final sessionListController _sessionListController = Get.put(sessionListController());
  final VideoController _videoController = Get.put(VideoController());


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.09451,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01860465116),
          child: Text(
            'Resources',
            style: GlobalVariables.textBold_24.copyWith(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Image.asset('assets/images/resources/resources_shortBG.png'),
              Padding(
                padding: EdgeInsets.all(width * 0.05581395348),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Roadmaps',
                          style: GlobalVariables.textBold_20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/roadmaps');
                          },
                          child: Text("See more",
                              style: GlobalVariables.textMedium_14.copyWith(
                                color: GlobalVariables.primaryColor,
                                decoration: TextDecoration.underline,
                              )),
                        )
                      ],
                    ),
                    Obx((){
                      if (_roadmapController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (_roadmapController.roadmaps.isEmpty) {
                        return const Center(child: Text('No roadmaps found.'));
                      }
                      final limitedRoadmaps = _roadmapController.roadmaps.take(4).toList();
                      final itemsPerRow = 3;
                      final rowCount = (limitedRoadmaps.length / itemsPerRow).ceil();
                      final rowHeight = height * 0.05;
                      final totalHeight = rowCount * rowHeight;

                      return Container(
                        height: totalHeight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: width*0.02581395348),
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: width * 0.02325581395,
                            runSpacing: height * 0.01287553648,
                            children: limitedRoadmaps.map((roadmap) {
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
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.02575107296,
                right: height * 0.02575107296,
                left: height * 0.02575107296,
                bottom: height * 0.01716738197),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Blogs',
                  style: GlobalVariables.textBold_20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/blogs');
                  },
                  child: Text("See more",
                      style: GlobalVariables.textMedium_14.copyWith(
                        color: GlobalVariables.primaryColor,
                        decoration: TextDecoration.underline,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27902145922,
            child: Obx(() {
              if (_blogController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (_blogController.blogs.isEmpty) {
                return const Center(child: Text('No blogs available'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _blogController.blogs.length,
                itemBuilder: (BuildContext context, int index) {
                  final blog = _blogController.blogs[index];
                  return Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0465116279),
                    child: BlogCard(blog: blog),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.02575107296,
                right: height * 0.02575107296,
                left: height * 0.02575107296,
                bottom: height * 0.01716738197),
            child: const Row(
              children: [
                Text(
                  'Inventory',
                  style: GlobalVariables.textBold_20,
                ),
                Spacer()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05581395348),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/inventory');
              },
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: GlobalVariables.shadowEffect,
                      color: GlobalVariables.secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 28),
                    child: Image.asset('assets/images/inventory.png'),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.02575107296,
                right: height * 0.02575107296,
                left: height * 0.02575107296,
                bottom: height * 0.01716738197),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Session Presentations',
                  style: GlobalVariables.textBold_20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/session_presentation');
                  },
                  child: Text("See more",
                      style: GlobalVariables.textMedium_14.copyWith(
                        color: GlobalVariables.primaryColor,
                        decoration: TextDecoration.underline,
                      )),
                )
              ],
            ),
          ),
          Obx(() {
            if (_sessionListController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_sessionListController.sessions.isEmpty) {
              return const Center(child: Text('No session found.'));
            }
            return Padding(
              padding: EdgeInsets.all(width * 0.05581395348),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: width * 0.02325581395,
                runSpacing: height * 0.01287553648,
                children: _sessionListController.sessions.map((roadmap) {
                  return SessionTag(
                    tagName: roadmap.name,
                    sessionId: roadmap.id,
                  );
                }).toList(),
              ),
            );
          }),
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.02575107296,
                right: height * 0.02575107296,
                left: height * 0.02575107296,
                bottom: height * 0.01716738197),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Videos',
                  style: GlobalVariables.textBold_20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/blogs');
                  },
                  child: Text("See more",
                      style: GlobalVariables.textMedium_14.copyWith(
                        color: GlobalVariables.primaryColor,
                        decoration: TextDecoration.underline,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30902145922,
            child: Obx(() {
              if (_videoController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (_videoController.videos.isEmpty) {
                return const Center(child: Text('No video found.'));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _videoController.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  final video = _videoController.videos[index];
                  return Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0465116279),
                    child: VideoCard(video: video ),
                  );
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}



