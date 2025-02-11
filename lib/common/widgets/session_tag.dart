import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/constants/global_variables.dart';

import '../../controllers/session/session_controller.dart';
import '../../screens/session_view-page.dart';

class SessionTag extends StatefulWidget {
  final String tagName;
  final String sessionId;
  const SessionTag({super.key, required this.tagName, required this.sessionId});

  @override
  State<SessionTag> createState() => _SessionTagState();
}

class _SessionTagState extends State<SessionTag> {
  final sessionController _sessionController = Get.put(sessionController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap:  () async {
        // Fetch roadmap details by ID
        await _sessionController.fetchSessionByID(widget.sessionId);

        // Navigate to the roadmap view page
        if (_sessionController.session.isNotEmpty) {
          Get.to(() => SessionViewPage(
            url: _sessionController.session['links'] ?? '',
            name: _sessionController.session['name'] ?? 'Unknown',
          ));
        } else {
          Get.snackbar("Error", "Failed to load session details.");
        }
      },
      child: Container(
        height: height * 0.03862660944,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), border: Border.all(width: 2),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              height: height * 0.03862660944,
              width: height * 0.0321888412,
              decoration: const BoxDecoration(
                  color: GlobalVariables.pinkColor,
                  border: BorderDirectional(end: BorderSide(width: 2))),
              child: Padding(
                padding: EdgeInsets.all(width * 0.01395348837),
                child: Image.asset('assets/icons/LinkIcon.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01860465116),
              child: Text(widget.tagName, style: GlobalVariables.textMedium_14),
            )
          ],
        ),
      ),
    );
  }
}
