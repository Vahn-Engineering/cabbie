import 'package:drivers_app/features/login/login_screen.dart';
// import 'package:drivers_app/features/onboarding/languageSelect/language_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drivers App',
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
        // .copyWith(
        //   bodyLarge: GoogleFonts.notoSans(
        //     fontSize: 20,
        //     fontWeight: FontWeight.w600,
        //   ),
        //   titleLarge: GoogleFonts.notoSans(
        //     fontSize: 22,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      home: const MyHomePage(title: 'Drivers App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return const LanguageSelect();
    return const LoginScreen();
  }
}
