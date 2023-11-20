import 'package:flutter/material.dart';
import 'package:pam_tugas2/data_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final DataRekomendasi menu;

  const HalamanDetail({super.key, required this.menu});

  @override
  State<HalamanDetail> createState() => _HalamaDetailState();
}

class _HalamaDetailState extends State<HalamanDetail> {

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
    final Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Tidak dapat membuka: $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    String diameter = widget.menu.nama.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
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
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(widget.menu.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.pink),
            onPressed: () {
              setState(() {
                widget.menu.isFavorite = !widget.menu.isFavorite;
              });
              if (widget.menu.isFavorite == false) {
                showInSnackBar("Berhasil Menghapus Favorite", Colors.red);
              }

              if (widget.menu.isFavorite == true) {
                showInSnackBar("Berhasil Menambahkan Favorite", Colors.blue);
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launcurl(widget.menu.imageLink);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: const Color(0xFFD306D),
        elevation: 0,
        child: const Icon(
          Icons.remove_red_eye,
          color: Colors.pinkAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.menu.imageLink,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.menu.imageLink,
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
                  Center(
                    child: Text(
                    diameter,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
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
                    widget.menu.deskripsi,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _openMapLink(widget.menu.deskripsi);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFD306D), // Button background color
                        onPrimary: Colors.white, // Text color when the button is enabled
                      ),
                      child: Text("Lihat Link Rekomendasi"),
                    ),
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
