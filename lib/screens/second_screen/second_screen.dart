import 'package:flutter/material.dart';
import 'package:test_suitmedia/core/constants/colors.dart';
import 'package:test_suitmedia/core/constants/text_styles.dart';
import 'package:test_suitmedia/screens/third_screen/third_screen.dart';
import 'package:test_suitmedia/widgets/custom_button.dart';

class SecondScreen extends StatefulWidget {
  final String userName;

  const SecondScreen({super.key, required this.userName});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUserName;

  void _navigateAndSelectUser() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ThirdScreen()),
    );

    if (result != null && result is String) {
      setState(() {
        selectedUserName = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Second Screen",
          style: AppTextStyles.headerScreen,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: IconColors.iconBack,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: AppColors.line,
            height: 0.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Welcome",
                      style: AppTextStyles.welcomeSecondScreen),
                  const SizedBox(height: 4),
                  Text(
                    widget.userName,
                    style: AppTextStyles.userName,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 303,
                  child: Text(
                    selectedUserName ?? "Selected User Name",
                    style: AppTextStyles.selectedUserName,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              label: "Choose a User",
              onPressed: _navigateAndSelectUser,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
