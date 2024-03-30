import 'package:flutter/material.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

class RecaptchaWidget extends StatefulWidget {
  final void Function(String) onTokenReceived;
  RecaptchaWidget({required this.onTokenReceived});

  @override
  _RecaptchaWidgetState createState() => _RecaptchaWidgetState();
}

class _RecaptchaWidgetState extends State<RecaptchaWidget> {
  String createdViewId = 'recaptcha_element';

  @override
  void initState() {
    ui.platformViewRegistry.registerViewFactory(
      createdViewId,
          (int viewId) => html.IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src =
            '/html/recaptcha.html'
        ..style.border = 'none',
    );
    html.window.onMessage.listen((msg) {
      String token = msg.data;
      widget.onTokenReceived(token);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
        child: HtmlElementView(viewType: createdViewId),
      ),
    );
  }
}
