import 'package:flutter/material.dart';

String uri = 'http://192.168.60.106:3000';
// String uri = 'https://some-mobileapp.herokuapp.com';

class Keys {
  static final messangerKey = GlobalKey<ScaffoldMessengerState>();
}

class GlobalVariables {
  //base URL
  static const baseUrl = "https://zairza-app-backend.vercel.app";

  //shadow effect
  static const shadowEffect = [
    BoxShadow(color: Colors.black, offset: Offset(1, 1)),
    BoxShadow(color: Colors.black, offset: Offset(2, 2)),
    BoxShadow(color: Colors.black, offset: Offset(3, 3)),
    BoxShadow(color: Colors.black, offset: Offset(4, 4))
  ];

  // COLORS

  static const primaryColor = Color(0xffFF8B2C);
  static const secondaryColor = Color(0xff23A094);
  static const pinkColor = Color(0xffFF90E8);
  static const appbarColor = Color(0xffFEFFFF);

  static var selectedNavBarColor = Colors.cyan[800];
  static const unselectedNavBarColor = Colors.black87;

  //Images
  static const List<String> carouselImages = [
    'assets/images/Carousel 4.png',
    'assets/images/Carousel 5.png',
    'assets/images/Carousel 6.png',
  ];

  //textstyles
  //TEXT REGULAR 12
  static const textRegular_12 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 12,
      letterSpacing: 0.2,
      height: 1.5);
  //TEXT MEDIUM 12
  static const textMedium_12 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 12,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 12
  static const textBold_12 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 12,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 14
  static const textRegular_14 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 14,
      letterSpacing: 0.2,
      height: 1.5);
  //TEXT MEDIUM 14
  static const textMedium_14 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 14,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 14
  static const textBold_14 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 14,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 16
  static const textRegular_16 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 16,
      letterSpacing: 0.2,
      height: 1.5);
  //TEXT MEDIUM 16
  static const textMedium_16 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 16,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 16
  static const textBold_16 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 16,
    letterSpacing: 0.2,
    height: 1.5,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 18
  static const textRegular_18 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 18,
      letterSpacing: 0.2,
      height: 28);
  //TEXT MEDIUM 18
  static const textMedium_18 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 18,
    letterSpacing: 0.2,
    height: 28,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 18
  static const textBold_18 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 18,
    letterSpacing: 0.2,
    height: 28,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 20
  static const textRegular_20 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 20,
      letterSpacing: 0.2,
      height: 24);
  //TEXT MEDIUM 20
  static const textMedium_20 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 20,
    letterSpacing: 0.2,
    height: 24,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 20
  static const textBold_20 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 20,
    letterSpacing: 0.2,
    height: 1.2,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 24
  static const textRegular_24 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 24,
      letterSpacing: 0.2,
      height: 28);
  //TEXT MEDIUM 24
  static const textMedium_24 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 24,
    letterSpacing: 0.2,
    height: 28,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 24
  static const textBold_24 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 24,
    letterSpacing: 0.2,
    height: 1.16,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 28
  static const textRegular_28 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 28,
      letterSpacing: 0.2,
      height: 34);
  //TEXT MEDIUM 28
  static const textMedium_28 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 28,
    letterSpacing: 0.2,
    height: 34,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 28
  static const textBold_28 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 28,
    letterSpacing: 0.2,
    height: 34,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 32
  static const textRegular_32 = TextStyle(
      fontFamily: 'Space_Grotesk',
      fontSize: 32,
      letterSpacing: 0.2,
      height: 38);
  //TEXT MEDIUM 32
  static const textMedium_32 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 32,
    letterSpacing: 0.2,
    height: 38,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 32
  static const textBold_32 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 32,
    letterSpacing: 0.2,
    height: 38,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 36
  static const textRegular_36 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 36,
    letterSpacing: 0.2,
    height: 44,
  );
  //TEXT MEDIUM 36
  static const textMedium_36 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 36,
    letterSpacing: 0.2,
    height: 44,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 36
  static const textBold_36 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 36,
    letterSpacing: 0.2,
    height: 44,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 40
  static const textRegular_40 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 40,
    letterSpacing: 0.2,
    height: 48,
  );
  //TEXT MEDIUM 40
  static const textMedium_40 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 40,
    letterSpacing: 0.2,
    height: 48,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 40
  static const textBold_40 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 40,
    letterSpacing: 0.2,
    height: 48,
    fontWeight: FontWeight.w900,
  );
  //TEXT REGULAR 48
  static const textRegular_48 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 48,
    letterSpacing: 0.2,
    height: 58,
  );
  //TEXT MEDIUM 48
  static const textMedium_48 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 48,
    letterSpacing: 0.2,
    height: 58,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 48
  static const textBold_48 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 48,
    letterSpacing: 0.2,
    height: 58,
    fontWeight: FontWeight.w900,
  );

  //TEXT REGULAR 60
  static const textRegular_60 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 60,
    letterSpacing: 0.2,
    height: 72,
  );
  //TEXT MEDIUM 60
  static const textMedium_60 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 60,
    letterSpacing: 0.2,
    height: 72,
    fontWeight: FontWeight.w700,
  );
  //TEXT BOLD 60
  static const textBold_60 = TextStyle(
    fontFamily: 'Space_Grotesk',
    fontSize: 60,
    letterSpacing: 0.2,
    height: 72,
    fontWeight: FontWeight.w900,
  );
}
