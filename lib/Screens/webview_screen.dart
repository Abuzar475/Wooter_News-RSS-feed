import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../color.dart';
import 'News_Feed.dart';

class WebViewScreen extends StatelessWidget {
  String url;
  WebViewScreen(this.url);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.close),
        //     onPressed: (){
        //       Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => RSSDemo(),
        //   ));
        //     },
        //   )
        // ],
backgroundColor: kPrimaryColor,
      ),

      body: WebView(
      //  initialUrl: 'https://flutter.io',
         initialUrl:  this.url,
      ),
    );
  }
}