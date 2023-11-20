import 'package:flutter/material.dart';
import 'package:pam_tugas2/data_menu.dart';
import 'halaman_detail.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FilteredPlanet = listRekomendasi.where((menu) => menu.isFavorite).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: const Color(0xFF2D2F41),
        foregroundColor:
        Color.fromARGB(255, 255, 255, 255), // Use your existing theme color
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: FilteredPlanet.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom yang diinginkan
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              final filteredPlanet =
              listRekomendasi.where((planet) => planet.isFavorite).toList();

              final DataRekomendasi menu = filteredPlanet[index];

              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: Colors.white,
                margin: EdgeInsets.zero,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HalamanDetail(menu: menu)));
                  },
                  child: Column(
                    children: [
                      Hero(
                        tag: menu.imageLink,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                          child: SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              menu.imageLink,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue[400],
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
                                        ? loadingProgress
                                        .cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
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
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
