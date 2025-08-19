import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String variant;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = "primary",
  });

  Color getButtonColor(String variant) {
    if (variant == "primary") {
      return Color(0xFFF55139);
    } else {
      return Color(0xFFF6F6F6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor: getButtonColor(variant), // button color
          foregroundColor: Colors.white, // text color
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
