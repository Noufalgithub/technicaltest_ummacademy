import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  const GeneralTextField({
    Key? key,
    this.controller,
    this.label,
    this.hintText,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.colorHint,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmitted,
    this.height,
    this.maxLines,
    this.suffixIcon,
    this.prefixText,
    this.labelColor,
    this.fontWeight,
    this.bgColor = Colors.white,
    this.borderRadius = 6,
    this.sizedBoxHeightLabel = 4,
    this.borderColor = Colors.grey,
    this.fontSizeHintText,
    this.fontSize,
    this.obscureText = false,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final double? fontSizeHintText;
  final TextInputType? inputType;
  final onChanged;
  final Color? colorHint;
  final onTap;
  final bool readOnly;
  final inputFormatters;
  final onSubmitted;
  final double? height;
  final int? maxLines;
  final Widget? suffixIcon;
  final String? prefixText;
  final Color? labelColor;
  final FontWeight? fontWeight;
  final Color bgColor;
  final double borderRadius;
  final double sizedBoxHeightLabel;
  final Color borderColor;
  final double? fontSize;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
              fontSize: 12, fontWeight: fontWeight, color: labelColor),
        ),
        SizedBox(
          height: sizedBoxHeightLabel,
        ),
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor)),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            obscureText: obscureText,
            onChanged: onChanged,
            maxLines: maxLines,
            onTap: onTap,
            onSubmitted: onSubmitted,
            readOnly: readOnly,
            inputFormatters: inputFormatters,
            style: TextStyle(fontSize: fontSize),
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixText: prefixText,
                prefixStyle: const TextStyle(color: Colors.black),
                hintText: hintText,
                border: InputBorder.none,
                hintStyle:
                    TextStyle(fontSize: fontSizeHintText, color: colorHint)),
          ),
        ),
      ],
    );
  }
}
