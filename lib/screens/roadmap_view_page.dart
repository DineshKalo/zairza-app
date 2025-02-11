import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RoadmapViewPage extends StatefulWidget{
  final String url;
  final String name;
  RoadmapViewPage({required this.url, required this.name});

  @override
  _RoadmapViewPage createState() {
    return _RoadmapViewPage();
  }
}

class _RoadmapViewPage extends State<RoadmapViewPage> {
  late final WebViewController _controller;

  @override
  void initState(){
    super.initState();
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.loadRequest(Uri.parse(widget.url));
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