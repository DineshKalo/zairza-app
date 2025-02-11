import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zairza_app/common/widgets/custom_icon_button.dart';
import 'package:zairza_app/common/widgets/project_card.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/screens/Profile/get_profile.dart';

import '../controllers/authentication/auth_controller.dart';
import '../controllers/authentication/profile_controller.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final AuthController _authController = Get.put(AuthController()); // Initialize controller
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _profileController.fetchProfile(); // Fetch profile data on initialization
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: ProfileApiService().retrieveProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Profile found.'));
          } else {
            Map<String, dynamic> _profile = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                  toolbarHeight: height * 0.09451,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 0.01860465116),
                    child: Row(
                      children: [
                        Text('My Profile',
                            style: GlobalVariables.textBold_24
                                .copyWith(color: Colors.black)),
                        const Spacer(),
                        const CustomIconButton(),
                        ElevatedButton(
                          onPressed: () async {
                            //temporarily added logout button
                            await _authController.logout();
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  )),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: width * 0.05581395348),
                  child: Column(
                    children: [
                      Container(
                        width: width * 0.88837209302,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: GlobalVariables.shadowEffect,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03720930232,
                              vertical: width * 0.03720930232),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: height * 0.06866952789,
                                    width: height * 0.06866952789,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(1, 1)),
                                          BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(2, 2))
                                        ],
                                        border: Border.all(width: 2)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(2),
                                        child: Image.asset(
                                            'assets/images/profile/profilePhoto/Profile1.png')),
                                  ),
                                  SizedBox(width: width * 0.05581395348),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _profile['name'],
                                        style: GlobalVariables.textBold_20,
                                      ),
                                      Text(
                                        '${_profile['branch']} + 2021-25 + ${_profile['batch']} Year',
                                        style: GlobalVariables.textBold_12
                                            .copyWith(
                                                color: GlobalVariables
                                                    .primaryColor),
                                      ),
                                      SizedBox(
                                        height: height * 0.00429184549,
                                      ),
                                      Text(
                                        _profile['zairza_id'],
                                        style: GlobalVariables.textRegular_12
                                            .copyWith(height: 1.2),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01287553648,
                              ),
                              Text(
                                'Domain -',
                                style: GlobalVariables.textBold_16.copyWith(
                                    color: GlobalVariables.primaryColor),
                              ),
                              Text((_profile['skills'] as List).join(' | '),
                                  style: GlobalVariables.textRegular_14),
                              SizedBox(
                                height: height * 0.01287553648,
                              ),
                              Text(
                                'Join me on-',
                                style: GlobalVariables.textBold_16.copyWith(
                                    color: GlobalVariables.primaryColor),
                              ),
                              SizedBox(
                                height: height * 0.00429184549,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/images/profile/joinMeOn/mail.png',
                                      width: width * 0.09302325581),
                                  SizedBox(width: width * 0.03720930232),
                                  Image.asset(
                                      'assets/images/profile/joinMeOn/linkedin.png',
                                      width: width * 0.09302325581),
                                  SizedBox(width: width * 0.03720930232),
                                  Image.asset(
                                      'assets/images/profile/joinMeOn/behance.png',
                                      width: width * 0.09302325581),
                                  SizedBox(width: width * 0.03720930232),
                                  Image.asset(
                                      'assets/images/profile/joinMeOn/github.png',
                                      width: width * 0.09302325581)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02575107296),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: GlobalVariables.shadowEffect,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2)),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                              horizontal: width * 0.03720930232,
                              vertical: height * 0.00858369098),
                          iconColor: GlobalVariables.primaryColor,
                          textColor: GlobalVariables.primaryColor,
                          // trailing: Container(
                          //     height: 40,
                          //     width: 40,
                          //     decoration: BoxDecoration(
                          //         // color: const Color(0xffFF90E8),
                          //         border: Border.all(color: Colors.black, width: 2),
                          //         borderRadius: BorderRadius.circular(4)),
                          //     child: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: Colors.black,
                          //       size: 30,
                          //     )),
                          collapsedIconColor: Colors.black,
                          title: const Text(
                            'Achievements',
                            style: GlobalVariables.textBold_20,
                          ),
                          backgroundColor: Colors.white,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(width: 0)),
                          expandedAlignment: Alignment.topLeft,
                          childrenPadding: EdgeInsets.only(
                              left: width * 0.03720930232,
                              right: width * 0.03720930232,
                              bottom: height * 0.02145922746),
                          children: const [
                            Text('- data'),
                            Text('- data'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02575107296,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: GlobalVariables.shadowEffect,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 2)),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.symmetric(
                              horizontal: width * 0.03720930232,
                              vertical: height * 0.00858369098),
                          iconColor: GlobalVariables.primaryColor,
                          textColor: GlobalVariables.primaryColor,
                          // trailing: Container(
                          //     height: 40,
                          //     width: 40,
                          //     decoration: BoxDecoration(
                          //         // color: const Color(0xffFF90E8),
                          //         border: Border.all(color: Colors.black, width: 2),
                          //         borderRadius: BorderRadius.circular(4)),
                          //     child: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: Colors.black,
                          //       size: 30,
                          //     )),
                          collapsedIconColor: Colors.black,
                          title: const Text(
                            'Jobs / Internships',
                            style: GlobalVariables.textBold_20,
                          ),
                          backgroundColor: Colors.white,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(width: 0)),
                          expandedAlignment: Alignment.topLeft,
                          childrenPadding: EdgeInsets.only(
                              left: width * 0.03720930232,
                              right: width * 0.03720930232,
                              bottom: height * 0.02145922746),
                          children: const [
                            Text('- data'),
                            Text('- data'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02575107296,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('My Projects',
                              style: GlobalVariables.textBold_20),
                          Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: GlobalVariables.shadowEffect,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Icon(Icons.add_box_outlined)),
                        ],
                      ),
                      SizedBox(height: height * 0.02575107296),
                      const ProjectCard(
                        title: "Hello",
                        date: '28th May,2024',
                        wing: 'Software',
                        state: 'Ongoing',
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}


//
//
// class MyProfile extends StatefulWidget {
//   const MyProfile({super.key});
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile> {
//   final AuthController _authController = Get.put(AuthController());
//   final ProfileController _profileController = Get.put(ProfileController());
//
//   @override
//   void initState() {
//     super.initState();
//     _profileController.fetchProfile(); // Fetch profile data on initialization
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Obx(() {
//       if (_profileController.isLoading.value) {
//         // Show loading indicator while fetching data
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       final profile = _profileController.profile;
//
//       if (profile.isEmpty) {
//         // Handle case where no profile data is available
//         return const Center(
//           child: Text("Failed to load profile. Please try again."),
//         );
//       }
//
//       // Main Profile UI with fetched data
//       return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: height * 0.09451,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               Text(
//                 'My Profile',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () async {
//                   //temporarily added logout button
//                           await _authController.logout();
//                 },
//                 child: const Text('Logout'),
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.055),
//             child: Column(
//               children: [
//                 // Profile Info
//                 Container(
//                   width: width * 0.888,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
//                     ],
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(width: 2),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: width * 0.037,
//                       vertical: width * 0.037,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             // Profile Image
//                             Container(
//                               height: height * 0.068,
//                               width: height * 0.068,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(4),
//                                 border: Border.all(width: 2),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(2),
//                                 child: Image.asset(
//                                     'assets/images/profile/profilePhoto/Profile1.png'),
//                               ),
//                             ),
//                             SizedBox(width: width * 0.05),
//                             // User Details
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   profile['name'] ?? "No Name",
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${profile['branch']} | Batch ${profile['batch']}',
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 Text(
//                                   profile['zairza_id'] ?? "No Zairza ID",
//                                   style: const TextStyle(fontSize: 12),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: height * 0.02),
//                         // Skills
//                         Text(
//                           'Domain -',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         Text(
//                           (profile['skills'] as List).join(' | '),
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
