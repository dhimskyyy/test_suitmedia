import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_suitmedia/core/constants/colors.dart';
import 'package:test_suitmedia/screens/first_screen/first_screen.dart';
import 'package:test_suitmedia/providers/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Palindrome App',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.background,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
