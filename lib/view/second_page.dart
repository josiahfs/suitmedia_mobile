import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: GoogleFonts.poppins()),
      ),
      body: SafeArea(
        child: Text('second page'),
        // child: Text(data),
      ),
    );
  }
}
