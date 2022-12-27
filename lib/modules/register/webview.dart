import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key}) : super(key: key);

  var url = 'https://sites.google.com/view/kadojobs-terms-conditions/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Terms & Conditions'),),
        body: Column(
          children: [
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(url)),
              ),
            )
          ],
        ));
  }
}
