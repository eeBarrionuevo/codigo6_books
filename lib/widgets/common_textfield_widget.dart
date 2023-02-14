import 'package:flutter/material.dart';

class CommonTextFieldWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData icon;
  int? maxLines;

  CommonTextFieldWidget({
    required this.hintText,
    required this.icon,
    required this.label,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $label:",
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 12,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(icon),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
