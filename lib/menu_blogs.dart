import 'package:flutter/material.dart';
import 'basenetwork.dart';
import 'model2.dart';

class HalamanBlogs extends StatefulWidget {
  const HalamanBlogs({Key? key}) : super(key: key);

  @override
  State<HalamanBlogs> createState() => _HalamanBlogsState();
}

class _HalamanBlogsState extends State<HalamanBlogs> {
  List<Blogs> listNews = [];
  BaseNetwork baseNetwork = BaseNetwork("blogs");

  getNewsData() async {
    // Use the BaseNetwork instance to fetch news data
    final result = await baseNetwork.get();

    // Check if the result has the expected data structure
    if (result.containsKey("blogs")) {
      setState(() {
        listNews = (result['blogs'] as List)
            .map((item) => Blogs.fromJson(item))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getNewsData(); // Fetch news data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLOGS LIST",
          style: TextStyle(
              color: Colors.pinkAccent, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: const Color(0xFFD306D),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.pinkAccent,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ), ),
      body: listNews.isEmpty
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.blue[400],
        ),
      )
          : ListView.builder(
        itemCount: listNews.length,
        itemBuilder: (context, index) {
          final Blogs blogs = listNews[index];
          return Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  // Handle news item click as needed
                },
                child: Column(
                  children: [
                    // Assuming imageUrl is a network image
                    CircleAvatar(
                      backgroundImage: NetworkImage(blogs.summary ?? ''),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        blogs.title ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      blogs.summary ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
