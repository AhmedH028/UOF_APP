import 'package:flutter/material.dart';

class UPEILogoBar extends StatelessWidget {
  const UPEILogoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Image.asset(
        'assets/images/upei_logo.png',
        width: 100,
        height: 100,
      ),
    );
  }
}
