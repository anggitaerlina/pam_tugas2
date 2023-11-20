import 'package:flutter/material.dart';
import 'package:pam_tugas2/model.dart';

class DetailNews extends StatefulWidget {
  final News news; // Change the type to News

  const DetailNews({Key? key, required this.news}) : super(key: key);

  @override
  State<DetailNews> createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
        // Add any additional customization for the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display details of the news using widget.news properties
            Text('News Title: ${widget.news.title}'),
            Text('News Content: ${widget.news.summary}'),
            // Add more widgets to display other details as needed
          ],
        ),
      ),
    );
  }
}
