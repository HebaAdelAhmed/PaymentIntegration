import 'package:flutter/material.dart';
import 'package:payment_integration/shared/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaCardScreen extends StatefulWidget {
  VisaCardScreen({super.key});

  @override
  State<VisaCardScreen> createState() => _VisaCardScreenState();
}

class _VisaCardScreenState extends State<VisaCardScreen> {
  late final WebViewController controller;

  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://accept.paymob.com/api/acceptance/iframes/789039?payment_token=$finalTokenCard'),
      );
  }

  @override
  Widget build(BuildContext context) {
    print('https://accept.paymob.com/api/acceptance/iframes/789039?payment_token=$finalTokenCard');
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
