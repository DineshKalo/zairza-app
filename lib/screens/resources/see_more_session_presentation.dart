import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/controllers/session/session_controller.dart';

import '../../common/widgets/session_tag.dart';
import '../../constants/global_variables.dart';

class SeeMoreSessionPresentation extends StatelessWidget {
  const SeeMoreSessionPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionListController _listController = Get.put(sessionListController());
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
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.01860465116),
          child: Text(
            'Session Presentations',
            style: GlobalVariables.textBold_24.copyWith(color: Colors.black),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/resources_largeBG.png'),
          Obx((){
            if (_listController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_listController.sessions.isEmpty) {
              return const Center(child: Text('No session found.'));
            }
            return SizedBox(
              height: 20,
              child: Padding(
                padding: EdgeInsets.all(width*0.05581395348),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: width * 0.02325581395,
                  runSpacing: height * 0.01287553648,
                  children: _listController.sessions.map((roadmap) {
                    return SessionTag(
                      tagName: roadmap.name, // Display roadmap name
                      sessionId: roadmap.id, // Pass roadmap ID for navigation
                    );
                  }).toList(),
                ),
              ),
            );

          })
          
        ],
      ),
    );
  }
}
