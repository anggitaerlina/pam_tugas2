import 'package:flutter/material.dart';
import 'package:pam_tugas2/data_menu.dart';
import 'halaman_detail.dart';

// Menu Reports
class HalamanReports extends StatefulWidget {
  final DataRekomendasi menu;

  const HalamanReports({Key? key, required this.menu}) : super(key: key);

  @override
  State<HalamanReports> createState() => _HalamanReportsState();
}

class _HalamanReportsState extends State<HalamanReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REPORTS LIST",
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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: listRekomendasi.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final DataRekomendasi menu = listRekomendasi[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: InkWell(
                borderRadius: BorderRadius.circular(4.0),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HalamanDetail(menu: menu),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Hero(
                      tag: menu.imageLink,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            menu.imageLink,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue[400],
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        menu.nama,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

