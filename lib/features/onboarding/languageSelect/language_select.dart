import 'dart:io';

import 'package:drivers_app/commonComponent/custom_button.dart';
import 'package:drivers_app/features/onboarding/languageSelect/component/language_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  String selectedLanguage = "hindi";

  void _onLanguageSelected(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
            bottom: Platform.isAndroid ? 24 : 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 16,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ऐप भाषा चुनें",
                          style: TextStyle(
                            color: Color(0xFF1F1F1F),
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "अपनी पसंदीदा ऐप भाषा का चयन करें।",
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  LanguageOption(
                    value: "hindi",
                    labelNative: "हिन्दी",
                    labelEnglish: "Hindi",
                    symbol: "ह",
                    selectedValue: selectedLanguage,
                    onSelected: _onLanguageSelected,
                  ),

                  LanguageOption(
                    value: "tamil",
                    labelNative: "தமிழ்",
                    labelEnglish: "Tamil",
                    symbol: "த",
                    selectedValue: selectedLanguage,
                    onSelected: _onLanguageSelected,
                  ),
                ],
              ),

              CustomButton(
                text: "जारी रखें",
                variant: "primary",
                onPressed: () {
                  if (kDebugMode) {
                    print("Button pressed!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
