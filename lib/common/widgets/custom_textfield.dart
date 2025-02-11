import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final double width;
  final double height;
  const CustomTextfield({Key? key, required this.hinttext, required this.width, required this.height, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 2,
            color: const Color(0xff000000),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration.collapsed(
              hintText: hinttext,
              hintStyle: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: Color(0xffAFAEAE)))),
        ),
      ),
    );
  }
}
