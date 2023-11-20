import 'package:flutter/material.dart';
import 'model2.dart';

class DetailBlogs extends StatefulWidget {
  final Blogs blogs;

  const DetailBlogs({Key? key, required this.blogs}) : super(key: key);

  @override
  State<DetailBlogs> createState() => _DetailBlogsState();
}

class _DetailBlogsState extends State<DetailBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Blogs'), // Corrected title
        // Add any additional customization for the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display details of the blogs using widget.blogs properties
            Text('Blog Title: ${widget.blogs.title}'),
            Text('Blog Summary: ${widget.blogs.summary}'),
            // Add more widgets to display other details as needed
          ],
        ),
      ),
    );
  }
}
