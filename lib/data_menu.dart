class DataRekomendasi {
  String nama;
  String imageLink;
  String deskripsi;
  bool isFavorite;


  DataRekomendasi({
    required this.nama,
    required this.imageLink,
    required this.deskripsi,
    required this.isFavorite,
  });
}


var listRekomendasi = [
  DataRekomendasi(
    nama: "NEWS",
    imageLink: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMmoflBGmAg83FTMM8lmAMbJTAIRNnzJGH_Q&usqp=CAU",
    deskripsi:
    "Rocket engine startup Ursa Major plans to break into the solid rocket motor market, the company announced Nov. 20.",
    isFavorite: false,
  ),
  DataRekomendasi(
    nama: "BLOGS",
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShKbsyyL9XDFauLD2xt4eKpe6ixVlRSK1Kyw&usqp=CAU",
    deskripsi: "Payloads: Boeing Environment Responding Antimicrobial Coatings (Antimicrobial Coatings): The crew deployed the six experiment placards in various locations throughout the ISS. These placards will remain deployed for approximately four months and will be touched regularly by the crew as part of the investigation. Boeing Environment Responding Antimicrobial Coatings tests an antimicrobial coating on several different …",
    isFavorite: false,
  ),
  DataRekomendasi(
    nama: "REPORTS",
    imageLink:
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtbbJAuwhqZNCm2JYjzmcJc9tQs4yVfoc7xQ&usqp=CAU",
    deskripsi: "Payloads: Cell Gravisensing-2 (CGS-2): Confocal Space Microscope sample observations were continued for the CGS-2 six-day experiment session. Recent spaceflight experiments have revealed that individual animal cells can feel the effects of gravity. However, how cells can sense gravity is largely unknown, thus understanding this mechanism emerges as one of the most important problems to be …",
    isFavorite: false,
  ),


];