import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 56,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : child,
      ),
    );
  }
}