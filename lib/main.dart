import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zairza_app/constants/global_variables.dart';
import 'package:zairza_app/models/user_model.dart';
import 'package:zairza_app/screens/card_details.dart';
import 'package:zairza_app/screens/home_screen.dart';
import 'package:zairza_app/screens/resources/inventory.dart';
import 'package:zairza_app/screens/resources/see_more_blogs.dart';
import 'package:zairza_app/screens/resources/see_more_roadmaps.dart';
import 'package:zairza_app/screens/resources/see_more_session_presentation.dart';
import 'controllers/authentication/auth_controller.dart';
import 'screens/authentication/sign_in.dart';
import 'nav.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/auth_screen.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.appbarColor,
        fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      ),
      home:  NavigationBarPage(givenIndex: 0),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/home_card': (context) => const CardDetails(),
        '/roadmaps': (context) => const SeeMoreRoadMaps(),
        '/blogs': (context) => const SeeMoreBlogs(),
        '/session_presentation': (context) =>
            const SeeMoreSessionPresentation(),
        '/inventory': (context) => const Inventory(),
        '/project': (context) => const NavigationBarPage(givenIndex: 2)
      },
    );
  }
}


class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    // calling restoreSession() in the initialization.
    authController.restoreSession();

    return Obx(() {
      if (authController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (authController.isAuthenticated.value) {
        return NavigationBarPage(givenIndex: 0);
      } else {
        return SignIn();
      }
    });
  }
}

