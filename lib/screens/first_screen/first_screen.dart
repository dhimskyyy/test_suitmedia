import 'package:flutter/material.dart';
import 'package:test_suitmedia/core/constants/colors.dart';
import 'package:test_suitmedia/core/utils/helpers.dart';
import 'package:test_suitmedia/core/constants/text_styles.dart';
import 'package:test_suitmedia/screens/second_screen/second_screen.dart';
import 'package:test_suitmedia/widgets/custom_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  void _checkPalindrome() {
    final text = palindromeController.text.trim();
    final isPalin = Helpers.isPalindrome(text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Result"),
        content: Text(isPalin ? "isPalindrome" : "not palindrome"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _goToSecondScreen() {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(userName: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/photo.png",
                  fit: BoxFit.cover,
                  width: 116,
                  height: 116,
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Input Name
            SizedBox(
              width: 310,
              height: 40,
              child: TextField(
                controller: nameController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: AppTextStyles.hint,
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSide,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSide,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSecondary,
                      width: 1,
                    ),
                  ),
                ),
                style: AppTextStyles.input,
              ),
            ),
            const SizedBox(height: 22),

            // Input Palindrome
            SizedBox(
              width: 310,
              height: 40,
              child: TextField(
                controller: palindromeController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  hintText: 'Palindrom',
                  hintStyle: AppTextStyles.hint,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSide,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSide,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.borderSecondary,
                      width: 1,
                    ),
                  ),
                ),
                style: AppTextStyles.input,
              ),
            ),

            const SizedBox(height: 50),

            // Button Check
            CustomButton(
              label: "CHECK",
              onPressed: _checkPalindrome,
            ),
            const SizedBox(height: 22),

            // Button Next
            CustomButton(
              label: "NEXT",
              onPressed: _goToSecondScreen,
            ),
          ],
        ),
      ),
    );
  }
}
