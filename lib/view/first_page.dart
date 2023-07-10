import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobile/controller/palindrome_controller.dart';
import 'package:suitmedia_mobile/view/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final PalindromeController palindromeController =
      Get.put(PalindromeController());
  final nameController = TextEditingController();
  String nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/ic_photo.png'),
                const SizedBox(height: 52),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: TextField(
                      controller: palindromeController.textController.value,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Palindrome',
                        // hintText: 'Nama',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 44),
                ElevatedButton(
                  onPressed: () {
                    palindromeController.checkPalindrome();
                    // palindromeController.name.value = nameController.text;
                    nama = nameController.text;
                    Future.delayed(const Duration(milliseconds: 100), () {
                      palindromeController.showPalindromeDialog();
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff2B637B)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 40)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'CHECK',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(
                  () => ElevatedButton(
                    onPressed: palindromeController.isPalindrome.value &&
                            nameController.text.isNotEmpty
                        ? () => Get.to(
                              SecondPage(),
                              arguments: nama,
                            )
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        palindromeController.isPalindrome.value
                            ? const Color(0xff2B637B)
                            : Colors.grey,
                      ),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 40)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
