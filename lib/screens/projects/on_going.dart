import 'package:flutter/material.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/screens/projects/project_list.dart';

class OnGoingProjects extends StatelessWidget {
  const OnGoingProjects({super.key});

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05581395348,
              vertical: width * 0.05581395348),
          child: Column(children: [
            SearchBar(
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )),
              side: const MaterialStatePropertyAll(BorderSide(width: 2)),
              hintStyle:
                  const MaterialStatePropertyAll(GlobalVariables.textMedium_14),
              hintText: "Search from ongoing projects",
              leading: const Icon(Icons.search),
              padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: width * 0.01860465116 * 2)),
              elevation: const MaterialStatePropertyAll(0),
            ),
            const ProjectsList(
              state: "Ongoing",
            )
          ]),
        ),
      ),
    );
  }
}
