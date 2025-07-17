import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const hint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.placeholder,
  );

  static const headerScreen = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const welcomeSecondScreen = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const userName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const selectedUserName = TextStyle(
  fontSize: 24,
  height: 1.5,
  fontWeight: FontWeight.w600,
  color: AppColors.black,
);

  static const buttonText = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: AppColors.grey,
  );

  static const input = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

}
