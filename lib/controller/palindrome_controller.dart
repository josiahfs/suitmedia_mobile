import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PalindromeController extends GetxController {
  final textController = TextEditingController().obs;
  final isPalindrome = false.obs;
  final name = ''.obs;

  bool checkPalindrome() {
    String enteredText = textController.value.text;
    String cleanText =
        enteredText.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    isPalindrome.value = cleanText == reversedText;
    return isPalindrome.value;
  }

  void showPalindromeDialog() {
    String message = isPalindrome.value ? 'isPalindrome' : 'not palindrome';
    Get.defaultDialog(title: 'Palindrome Check', content: Text(message));
  }
}
