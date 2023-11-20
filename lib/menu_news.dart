import 'package:flutter/material.dart';
import 'basenetwork.dart';
import 'model.dart';

class HalamanNews extends StatefulWidget {
  const HalamanNews({Key? key}) : super(key: key);

  @override
  State<HalamanNews> createState() => _HalamanNewsState();
}

class _HalamanNewsState extends State<HalamanNews> {
  List<News> listNews = [];
  BaseNetwork baseNetwork = BaseNetwork("news");

  getNewsData() async {
    // Use the BaseNetwork instance to fetch news data
    final result = await baseNetwork.get();

    // Check if the result has the expected data structure
    if (result.containsKey("news")) {
      setState(() {
        listNews = (result['news'] as List)
            .map((item) => News.fromJson(item))
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
          "NEWS LIST",
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
          final News news = listNews[index];
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
                      backgroundImage: NetworkImage(news.imageUrl ?? ''),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        news.title ?? '',
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
                      news.summary ?? '',
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
