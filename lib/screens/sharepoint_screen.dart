import 'package:flutter/material.dart';

class SharePointScreen extends StatelessWidget {
  const SharePointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SharePoint')),
      body: const Center(child: Text('Access your shared documents here.')),
    );
  }
}
