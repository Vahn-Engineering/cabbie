import 'package:drivers_app/commonComponent/custom_button.dart';
import 'package:drivers_app/commonComponent/custom_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showBottomSheet = false;
  String _bottomSheetType = ""; // 'terms' || 'privacy'

  void updateBottomSheet(bool value, String type) {
    setState(() {
      _showBottomSheet = value;
      _bottomSheetType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: _showBottomSheet
          ? BottomSheet(
              onClosing: () {
                updateBottomSheet(false, "");
              },
              enableDrag: false,
              // backgroundColor: Color.fromARGB(255, 238, 234, 234),
              backgroundColor: Colors.white,
              builder: (context) {
                return _bottomSheetType == "terms"
                    ? ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 400),
                        child: Text("Terms and Conditions"),
                      )
                    : ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 400),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(bottom: 32),
                          child: Column(
                            spacing: 16,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFE2E2E2)),
                                ),
                                child: SvgPicture.asset(
                                  "assets/svg/close.svg",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Color(0xFFF5F5F5),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xFFE2E2E2),
                                          ),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 24,
                                      ),
                                      child: Text(
                                        "Enter OTP",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 24,
                                      ),
                                      child: Text("content"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            )
          : null,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(bottom: 16, left: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFEEEEEE), width: 1),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/logo.svg",
                    width: 100,
                    height: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to VAHN",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Enter your mobile number to get started.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Color(0xFF757575),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        spacing: 0,
                        children: [
                          CustomInput(),
                          Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                visualDensity: VisualDensity.compact,
                                checkColor: Colors.white,
                                activeColor: Colors.black,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              Text(
                                "Send me updates on WhatsApp",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF1F1F1F),
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/svg/whatsapp.svg",
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    text: "Get OTP",
                    onPressed: () {
                      if (kDebugMode) {
                        print("Button pressed!");
                      }
                    },
                    variant: "primary",
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 4, // gap between words on the same line
                    runSpacing: 4, // gap between lines
                    alignment: WrapAlignment.start,
                    children: [
                      Text("By continuing, you agree to our"),
                      GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            // print("Terms and Conditions pressed!");
                            updateBottomSheet(true, "terms");
                          }
                        },
                        child: Text(
                          "Terms and Conditions",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text("and"),
                      GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            // print("Privacy Policy pressed!");
                            updateBottomSheet(true, "privacy");
                          }
                        },
                        child: Text(
                          "Privacy Policy.",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
