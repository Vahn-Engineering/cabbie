import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String errorText;
  const CustomInput({super.key, this.errorText = ""});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focus.hasFocus;

    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _focus.requestFocus(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.errorText.isNotEmpty
                    ? Colors.red
                    : isFocused
                    ? Colors.black
                    : const Color(0xFFE2E2E2),
                width: widget.errorText.isNotEmpty ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mobile Number",
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.errorText.isNotEmpty
                        ? Colors.red
                        : Colors.black,
                    fontWeight: widget.errorText.isNotEmpty
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
                TextField(
                  onTapOutside: (_) => _focus.unfocus(),
                  focusNode: _focus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your mobile number",
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),

        widget.errorText.isNotEmpty
            ? Text(widget.errorText, style: TextStyle(color: Colors.red))
            : SizedBox(),
      ],
    );
  }
}
