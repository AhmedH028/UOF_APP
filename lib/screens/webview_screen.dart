// webview_screen.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController with settings
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print("Page loading: $url");
          },
          onPageFinished: (url) {
            print("Page finished loading: $url");
          },
          onWebResourceError: (error) {
            print("Error loading page: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reload();
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
