import 'package:drivers_app/commonComponent/custom_button.dart';
import 'package:drivers_app/commonComponent/custom_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            print("Terms and Conditions pressed!");
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
                            print("Privacy Policy pressed!");
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
