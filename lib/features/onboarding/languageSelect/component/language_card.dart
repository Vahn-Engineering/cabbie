import 'package:flutter/material.dart';

class LanguageOption extends StatelessWidget {
  final String value;
  final String labelNative;
  final String labelEnglish;
  final String symbol;
  final String selectedValue;
  final Function(String) onSelected;

  const LanguageOption({
    super.key,
    required this.value,
    required this.labelNative,
    required this.labelEnglish,
    required this.symbol,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedValue == value;
    return GestureDetector(
      onTap: () => onSelected(value),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Color(0xFFF55139)
                : Color(0xFFEEEEEE), // border color
            width: 1, // border thickness
          ),
          color: isSelected ? Color(0xFFFEEEEB) : Color(0xFFF6F6F6),
        ),
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 8,
              children: [
                Radio(
                  activeColor: Color(0xFFF55139),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: value,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    onSelected(value!);
                  },
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        labelNative,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        labelEnglish,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Text(
                symbol,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: isSelected ? Color(0xFFF55139) : Color(0xFF1F1F1F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
