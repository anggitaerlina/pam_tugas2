import 'package:flutter/material.dart';
import 'package:pam_tugas2/data_artikel.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamaDetail extends StatefulWidget {
  final DataPlanet planet;

  const HalamaDetail({super.key, required this.planet});

  @override
  State<HalamaDetail> createState() => _HalamaDetailState();
}

class _HalamaDetailState extends State<HalamaDetail> {
  late bool _isBookmarked = false;

  void showInSnackBar(String value, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: color,
      ),
    );
  }

  void _openMapLink(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Tidak dapat membuka: $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    String diameter = widget.planet.diameter.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Planet",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.pink),
            onPressed: () {
              setState(() {
                _isBookmarked = !_isBookmarked;
              });
              if (_isBookmarked == false) {
                showInSnackBar("Berhasil Menghapus Favorite", Colors.red);
              }

              if (_isBookmarked == true) {
                showInSnackBar("Berhasil Menambahkan Favorite", Colors.blue);
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcurl(widget.planet.imageLink);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.blue[400],
        elevation: 0,
        child: const Icon(
          Icons.preview,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.planet.imageLink,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.planet.imageLink,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue[400],
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.planet.nama,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    "Ciri Planet",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.planet.ciri,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Diameter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    diameter,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 14),
                  const Text(
                    "Deskripsi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.planet.deskripsi,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _openMapLink(widget.planet.link);
                    },
                    child: Text("Lihat Link Artikel"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launcurl(String link) async {
    final Uri uri = Uri.parse(link);
    if (!await launchUrl(uri)) {
      throw Exception("gagal buka link : $uri");
    }
  }
}
