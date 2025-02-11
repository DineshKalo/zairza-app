import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SessionViewPage extends StatefulWidget{
  final String url;
  final String name;
  SessionViewPage({required this.url, required this.name});

  @override
  _SessionViewPage createState() {
    return _SessionViewPage();
  }
}

class _SessionViewPage extends State<SessionViewPage> {
  late final WebViewController _controller;
  String _ensureUrlHasScheme(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }
    return url;
  }

  @override
  void initState(){
    super.initState();
    print(widget.url);
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    final fullUrl = _ensureUrlHasScheme(widget.url);
    _controller.loadRequest(Uri.parse(fullUrl));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}