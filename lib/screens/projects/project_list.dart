import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/common/widgets/project_card.dart';
import 'package:zairza_app/controllers/projects/project_controller.dart';
import 'package:zairza_app/screens/projects/project_api_service.dart';
import '../../models/project_model.dart';
import 'package:intl/intl.dart';


class ProjectsList extends StatefulWidget {
  final String? state;
  final int? maxProjectsToShow;

  const ProjectsList({
    super.key,
    this.maxProjectsToShow,
    this.state,
  });

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  final ProjectController _projectController = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Obx(() {
      if (_projectController.isLoading.value) {
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            CircularProgressIndicator(),
          ],
        );
      } else if (_projectController.projects.isEmpty) {
        return const Center(child: Text('No projects found.'));
      } else {
        // Filter projects based on the `state` value
        List<Project> filteredProjects = _projectController.projects
            .where((project) =>
        widget.state == null || project.status == widget.state)
            .toList();

        if (filteredProjects.isEmpty) {
          return const Center(child: Text('No matching projects found.'));
        }

        // Limit the number of projects to display
        int projectsToShow = widget.maxProjectsToShow ?? filteredProjects.length;
        List<Project> projectsToDisplay =
        filteredProjects.take(projectsToShow).toList();
        return Column(
          children: filteredProjects.sublist(0, projectsToShow).map((project) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: height * 0.01072961373,
                top: height * 0.02575107296,
              ),
              child: ProjectCard(
                title: project.title,
                date: DateFormat('dd-MM-yyyy').format(project.dateAndTime),
                wing: project.wing,
                state: project.status,
              ),
            );
          }).toList(),
        );
      }
    });
  }
}
