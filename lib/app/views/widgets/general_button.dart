import 'package:flutter/material.dart';
import 'package:technicaltest_ummacademy/core/utils/constants.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    this.backgroundColor = MyConstants.blueColor,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.circular = 4,
  }) : super(key: key);

  final Color backgroundColor;
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double circular;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circular),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
